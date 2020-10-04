class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :message
      t.string :mail
      t.timestamps
    end
  end
end
