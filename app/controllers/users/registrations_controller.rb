# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_address, only: [:edit, :update]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def edit
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def update
    if @address.update(address_params)
      redirect_to root_path, notice: '更新しました'
    else
      render :edit
    end
  end
  
  
  def new_address
    @address = Address.new
  end

  def create_address
    @user = current_user.id
    @address = Address.create(address_params)
    if @address.save
      redirect_to new_card_path
    else
      render 'new_address'
    end

  end

  private

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def address_params
    params.require(:address).permit(:name, :name_kana, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tell).merge(user_id: current_user.id)
  end
end
