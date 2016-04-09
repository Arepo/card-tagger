require 'bundler/setup'
require 'pakyow'
require 'active_record'
require_relative 'lib/models/card.rb'

Pakyow::App.define do
  configure :global do
    Bundler.require :default, Pakyow::Config.env

    # put global config here and they'll be available across environments
    app.name = 'Pakyow'
  end

  configure :development do
    db_options = {
      adapter: 'postgresql',
      database: 'card_tagging_development'
    }

    ActiveRecord::Base.establish_connection(db_options)
  end

  configure :prototype do
    # an environment for running the front-end prototype with no backend
    app.ignore_routes = true
  end

  configure :staging do
    # put your staging config here
  end

  configure :production do
    db_options =  {
      adapter: 'postgresql',
      database: 'card_tagging_production'
    }

    ActiveRecord::Base.establish_connection(db_options)
  end

  middleware do |builder|
    # TODO: you will most definitely want to change this secret
    builder.use Rack::Session::Cookie, key: "#{Pakyow::Config.app.name}.session", secret: 'sekret'
  end
end