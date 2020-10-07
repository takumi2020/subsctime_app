class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true



  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }  #ハイフンなし7桁
  validates :prefecture_id, :city, :house_number, :tell, presence: true
  validates :building_name, presence: false
end
