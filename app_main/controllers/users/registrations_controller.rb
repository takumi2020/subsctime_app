# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def updata
    @user = User.find(params[:id])
    if @user.update
      flash[:notice] = "内容を更新しました"   
      redirect_to root
    else
      flash.now[:alert] = "編集内容を確認してください"
    end
  end


end
