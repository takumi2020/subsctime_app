class Comment < ApplicationRecord
  belongs_to :product  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
