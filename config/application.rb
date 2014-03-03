require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module StandupBoard
  
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

  end
end

module InDinero 
    FACEBOOK_KEY =  ENV['FACEBOOK_KEY'] || "664312486963048";
    FACEBOOK_SECRET = ENV['FACEBOOK_SECRET'] || "f08573b6761ee0eb5410d77ad5aa1056";
    GITHUB_KEY =  ENV['GITHUB_KEY'] || "7952842f9b63f1d7bfe9";
    GITHUB_SECRET = ENV['GITHUB_SECRET'] || "89d4cfa53734d3fef8690ad3d2622617ebd94dfe";

end
