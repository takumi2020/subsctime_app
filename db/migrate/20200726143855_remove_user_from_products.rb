class RemoveUserFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :user, :integer
  end
end
