class FavoritesController < ApplicationController
  def create
    @favorites = current_user.favorites.create(product_id: params[:product_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @favorite = current_user.favorites.find_by(product_id: @product.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
