class AddImgToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :img, :string
  end
end
