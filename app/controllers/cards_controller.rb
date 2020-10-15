class CardsController < ApplicationController
  before_action :check_guest, only: :delete
  before_action :set_curd, only: [:delete, :show]

  require 'payjp'

  def new
  end

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト2020', 
      email: current_user.email,
      card: params['payjp_token'],
      metadata: {user_id: current_user.id}
      ) #
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card 
      )
      if @card.save
        redirect_to root_path
        flash[:notice] = "登録完了しました"
      else
        redirect_to action: "new"
      end
    end
  end


  def show
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def delete 
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete  
      redirect_to root_path, notice: '削除しました'
    end
  end

  private

  def set_curd
    card = Card.find_by(user_id: current_user.id)
  end


end