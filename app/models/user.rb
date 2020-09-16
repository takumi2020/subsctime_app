class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i(google)
          # :trackable,

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/i }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }

  has_many :products
  has_many :comments
  
  has_one :cards
  has_one :address, dependent: :destroy
    
  
  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first

    unless user
      user = User.create(name:     auth.info.name,
                        provider: auth.provider,
                        uid:      auth.uid,
                        email:    auth.info.email,
                        token:    auth.credentials.token,
                        password: Devise.friendly_token[0, 20],
                        meta:     auth.to_yaml)
    end
  end

end
