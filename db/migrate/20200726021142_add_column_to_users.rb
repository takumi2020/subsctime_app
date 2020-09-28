class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column  :users,  :confirmation_token,  :string
    add_column  :users,  :confirmed_at,        :datetime
    add_column  :users,  :confirmation_sent_at,:datetime    
    add_column  :users,  :unconfirmed_email,   :string 
    add_column  :users,  :provider,  :string
    add_column  :users,  :uid,       :string
    add_column  :users,  :token,       :string
    add_column  :users,  :meta,       :text
  end
end
