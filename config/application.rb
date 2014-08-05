require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Footwear
  class Application < Rails::Application

    config.action_mailer.delivery_method = :smtp 
    config.action_mailer.smtp_settings ={
    address:              'smtp.gmail.com', 
    port:                 587, 
    domain:               'gmail.com', 
    user_name:            'footwear.clickjogos@gmail.com', 
    password:             'clickjogos', 
    authentication:       'plain', 
    enable_starttls_auto: true  
    }
    config.action_mailer.raise_delivery_errors = true 

   # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = "pt-BR"

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.autoload_paths += %W(#{Rails.root}/config/extras/ #{Rails.root}/app/presenters/)     
  end
end