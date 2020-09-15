class UsersController < ApplicationController
  before_action :set_address, only: [:show, :edit]


  # def show
  # end
  
  # def edit
  #   if @address.update(address_params)
  #     flash[:notice] = "内容を更新しました"   
  #     redirect_to root_path
  #   else
  #     flash.now[:alert] = "編集内容を確認してください"
  #     render :show
  #   end
  # end

  # private
  # def address_params
  #   params.require(:address).permit(:name, :name_kana, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tell)
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end

  # def set_address
  #   @address = Address.find(params[:id])
  # end

end
