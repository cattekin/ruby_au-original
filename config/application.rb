require File.expand_path('boot', __dir__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyAu
  class Application < Rails::Application
    # Can't enable this until Rails 6.0.3 arrives with a zeitwerk/i18n fix.
    # config.load_defaults "6.0"

    # Settings in config/environments/* take precedence over those specified here.

    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.assets false
      g.helpers false
    end

    config.generators.javascript_engine = :js
  end
end
