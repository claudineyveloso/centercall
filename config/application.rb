require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Centercall
  # Application
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    config.time_zone = 'Brasilia'
    # config.active_record.default_timezone = 'Brasilia'

    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :'pt-BR'
    config.i18n.locale = :'pt-BR'

    config.generators do |g|
      g.test_framework :rspec, controller_specs: false, helper_specs: false,
                               routing_specs: false, view_specs: false
      g.factory_bot false
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'allowed-origin.com' # Substitua pelo domínio permitido
        resource '*', headers: :any,
                      methods: %i[get post put patch delete options head],
                      credentials: true
      end
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
