class Comment < ApplicationRecord
  belongs_to :product  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション


  validates :text, presence: true, length: {maximum: 20}

end