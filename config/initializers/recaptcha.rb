#./config/initializes/recaptcha.rb
# from github.com/ambethia/recaptcha README.rdoc
Recaptcha.configure do |config|

    config.public_key  = ENV['PUBLICKEY']
    config.private_key = ENV['PRIVATEKEY']

  end