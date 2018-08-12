# CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'                        # required
#   config.fog_credentials = {
#     provider:              'AWS',                        # required
#     aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
#     aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'],                        # required
#     region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
#   }
#   config.fog_directory  = 'vonflix'            # required
# end
CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'],
      region: 'eu-west-1',
      endpoint: 'https://s3.amazonaws.com'
    }
    config.fog_directory = 'vonflix'
    config.fog_public = false
    config.storage = :fog
  end
end