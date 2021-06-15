require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TraniningSys
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("vendor", "template")
    config.load_defaults 6.1

    config.i18n.available_locales = [:en, :vi]

    config.i18n.default_locale = :en

  end
end
