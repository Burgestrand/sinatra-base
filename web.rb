ENV['APP_NAME'] = 'web'

require_relative 'boot'
require_relative 'helpers'

require 'sinatra/respond_with'

#
# Configuration
#
configure do
  # Sinatra specific
  set :app_file, __FILE__

  # Compass
  Compass.configuration do |config|
    config.environment  = settings.environment
    config.output_style = :expanded
    config.relative_assets = true
    config.line_comments = false
  end

  # Sprockets (Asset pipeline!)
  sprockets = Sprockets::Environment.new(settings.root)
  %w(assets vendor).product(%w(javascripts stylesheets fonts images)).each do |*path|
    sprockets.append_path File.join(*path)
  end

  set :sprockets, sprockets
end

configure :development do
  # Sinatra::Reloader (sinatra-contrib)
  require 'sinatra/reloader'
  also_reload 'helpers.rb'
end

#
# Application
#
helpers Helpers do
end

get '/' do
  respond_with :index
end
