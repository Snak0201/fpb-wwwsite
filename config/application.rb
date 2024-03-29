require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.generators do |g|
      g.test_framework :rspec
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Asia/Tokyo"
    config.i18n.default_locale = :ja
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_view.sanitized_allowed_tags = Loofah::HTML5::SafeList::ALLOWED_ELEMENTS
    config.action_view.sanitized_allowed_attributes = Loofah::HTML5::SafeList::ALLOWED_ATTRIBUTES

    config.active_record.yaml_column_permitted_classes = [
      Time
    ]
  end
end
