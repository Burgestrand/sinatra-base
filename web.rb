ENV["APP_NAME"] = "web"

require_relative "boot"

require "sinatra"
require "sinatra/respond_with"

Sinatra.register Sinatra::CompassSupport

#
# Configuration
#
configure do
  set :app_file, __FILE__
  set :root, File.expand_path(File.dirname(__FILE__))
  set :assets, assets = Sprockets::Environment.new
  set :assets_path, "/assets"

  %w(assets vendor).product(%w(javascripts stylesheets fonts images)).each do |*path|
    assets.append_path File.join(*path)
  end

  assets.append_path Serenade::ASSET_PATH

  assets.js_compressor = Uglifier.new
  assets.css_compressor = Sprockets::Sass::Compressor.new

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
  require "sinatra/reloader"

  use Rack::LiveReload, no_swf: true
end

#
# Application
#
helpers Sprockets::Helpers, Rack::Utils do
  alias h escape_html

  def css(name, attrs = {})
    assets_for("#{name}.css") { |asset_path| "<link href='#{h asset_path}' rel='stylesheet'>" }.join
  end

  def js(name, attrs = {})
    assets_for("#{name}.js") { |asset_path| "<script src='#{h asset_path}'></script>" }.join
  end

  def assets_for(name)
    return [] unless asset = assets[name]

    result = []
    traverse = lambda do |asset|
      asset.dependencies.each(&traverse)
      result << asset
    end

    traverse[asset].uniq.map do |asset|
      yield File.join(settings.assets_path, asset.logical_path)
    end
  end

  def assets
    settings.assets
  end
end

get "/" do
  respond_with :index
end

get "#{settings.assets_path}/*.*" do |name, ext|
  not_found unless asset = assets["#{name}.#{ext}"]
  content_type  assets.mime_types[".#{ext}"]
  etag          asset.digest
  last_modified asset.mtime
  body          asset.body
end
