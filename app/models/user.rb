class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i(google)
          # :trackable,

  validates :name, presence: true
  has_many :products
  has_many :cards

  validates :name, presence: true #追記
  # validates :profile, length: { maximum: 200 } #追記
  
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
