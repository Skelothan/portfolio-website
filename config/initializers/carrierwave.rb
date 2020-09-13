# Source: 
# https://blog.makersacademy.com/how-to-use-aws-to-store-carrierwave-image-uploads-in-your-heroku-rails-app-1957f610c874
CarrierWave.configure do |config|
    
    config.fog_credentials = {
        provider:               "AWS",
        aws_access_key_id:      ENV["AWS_ACCESS_KEY"],
        aws_secret_access_key:  ENV["AWS_SECRET_KEY"],
        region:                 "us-east-1"
    }
    config.fog_directory = ENV["AWS_BUCKET"]
    config.fog_public = false
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.storage = :fog

end