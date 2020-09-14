class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]


  
  def index
    @products = Product.includes(:user).page(params[:page]).per(4).order("created_at DESC")
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
    @product = Product.find(params[:id])
    if @product.destroy
      # flash[:success] = 'Object was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to products_url
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:success] = "Object was successfully updated"
        redirect_to product_path
      else
        # flash[:error] = "Something went wrong"
        # render 'edit'
      end
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def search
    @products = Product.search(params[:keyword])
  end
  
  
  
  
  
  private

  def product_params
    params.require(:product).permit(:product_name, :description, :price, :img).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
