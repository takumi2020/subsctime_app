class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i(google)

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/i }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }

  has_many :products
  has_many :comments
  has_many :favorites, dependent: :destroy
  
  has_one :cards
  has_one :address, dependent: :destroy

  def already_favorited?(product)
    self.favorites.exists?(product_id: product.id)
  end
    
  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.create(name:     auth.info.name,
                        provider: auth.provider,
                        uid:      auth.uid,
                        email:    auth.info.email,
                        token:    auth.credentials.token,
                        password: Devise.friendly_token[0, 20],
                        meta:     auth.to_yaml)
    end
    user
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "GuestUser"
    end
  end
  
end
