class Product < ApplicationRecord
  mount_uploader :img, ImgUploader
  validates :product_name, presence: true
  belongs_to :user
  has_many :comments
  def self.search(search)
    if search
      Product.where('product_name LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end
