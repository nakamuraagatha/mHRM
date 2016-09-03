require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MHRM
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << Rails.root.join('lib')

    #RECAPTCHA ENV
    ENV['RECAPTCHA_PUBLIC_KEY'] = '6LdO6R8TAAAAAK4JOgsXtpNz3O-W0xT_DEaqxNMo'
    ENV['RECAPTCHA_PRIVATE_KEY'] =  "6LdO6R8TAAAAAM7okxh79m94rOYm9yR2lZNYcJrR"
  end
end
