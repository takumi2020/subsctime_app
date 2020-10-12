class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_product, only: [:edit, :show, :purchase, :done,:update, :destroy]
  before_action :set_address, only: [:done, :show]

  
  def index
    @products = Product.includes(:user).page(params[:page]).per(12).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      # flash[:success] = "Object successfully created"
      redirect_to root_path
    else
    end

  end

  def destroy
    if @product.destroy
      # flash[:success] = 'Object was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to products_url
    end
  end
  
  def edit
    if @product.user != current_user
      redirect_to root_path, alert: '不正なアクセスです'
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Object was successfully updated"
      redirect_to product_path
    else
      # flash[:error] = "Something went wrong"
      # render 'edit'
    end
  end

  def show
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def done
    if @address
      @address = Address.find_by(user_id: current_user.id)
      card = Card.find_by(user_id: current_user.id)
      if card.blank?
        flash[:alert] = '購入前にカード登録してください'
        redirect_to new_card_path and return
      else
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    else
      redirect_to product_path, alert: '住所を登録してください'
    end
  end

  def purchase
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(card.customer_id),
      currency: 'jpy'
    )
    flash[:alert] = '購入致しました'
    redirect_to root_path
  end

  def about
  end

  def search
    @products = Product.search(params[:keyword])
  end



  private

  def set_address
    if user_signed_in?
    @address = Address.exists?(user_id: current_user.id)
    end
  end

  def product_params
    params.require(:product).permit(:product_name, :description, :price, :img).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
