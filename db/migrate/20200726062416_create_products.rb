class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.string :description, limit: 400
      t.integer :price, null: false
      t.integer :user, foreign_key: true
      t.string :product_image
      t.timestamps
    end
  end
end
