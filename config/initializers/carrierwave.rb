require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
#     aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
#     region: 'ap-northeast-1'
#   }

#   config.fog_directory  = 'subsctime2020'
#   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/subsctime2020'
# end

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
  elsif Rails.env.production? #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
# credentials下にaws_access_key_idとaws_secret_access_keyはあるよ
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'subsctime2021'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/subsctime2021'
  end
end