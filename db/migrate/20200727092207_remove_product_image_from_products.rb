class RemoveProductImageFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :product_image, :string
  end
end
