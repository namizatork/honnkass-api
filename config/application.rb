require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Honnkass
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.

    # 基本言語を日本語
    config.i18n.default_locale = :ja

    # TimeZone関係も日本
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local

    config.generators do |g|
      # CSS/JSファイル不要(APIモードだし入れなくても生成されないかも)
      g.assets false
      # Helper不要(APIモードだし入れなくても生成されないかも)
      g.helper false
      # Rspecに関する設定
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: true,
                       fixtures: true
    end

    # CrossOriginの許可
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "*",
          headers: :any,
          methods: [:get, :post, :options, :head]
      end
    end
    config.api_only = true
    # APIモードだとflashメソッドないんですけど？ってよく怒られるので入れておく
    config.middleware.use ActionDispatch::Flash
  end
end
