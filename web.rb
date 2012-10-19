ENV['APP_NAME'] = 'web'

require_relative 'boot'

require 'sinatra'
require 'sinatra/respond_with'

Sinatra.register Sinatra::CompassSupport

#
# Configuration
#
configure do
  set :app_file, __FILE__
  set :root, File.expand_path(File.dirname(__FILE__))

  assets do
    %w[javascripts stylesheets images].each do |path|
      serve "/assets/#{path}", from: "assets/#{path}"
    end

    css :screen, %w[/assets/stylesheets/vendor/*.css /assets/stylesheets/screen.css]
    js  :app,    %w[/assets/javascripts/app.js]

    css_compression :sass
    js_compression  :uglify
  end

  Compass.configuration do |config|
    config.environment      = settings.environment
    config.output_style     = :expanded
    config.line_comments    = false
    config.relative_assets  = true
    config.images_dir       = "assets/images"
    config.http_images_path = "/assets/images"
  end
end

configure :development do
  # from: sinatra-contrib
  require 'sinatra/reloader'

  use Rack::LiveReload, no_swf: true
end

#
# Application
#
helpers do
end

get '/' do
  respond_with :index
end
