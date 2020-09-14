class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    product = Product.find(params[:id])
    @products = current_user.products.order("created_at DESC")
  end

  
end
