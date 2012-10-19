source :rubygems

ruby '1.9.3'

group :web, :rake do
  gem "sinatra"
  gem "sinatra-contrib", require: false
  gem "sinatra-support", require: "sinatra/support"
  gem "sinatra-assetpack", require: %w[sinatra/base sinatra/assetpack]
  gem "slim"
end

group :web_development, :rake do
  gem 'compass'
  gem 'coffee-script'
  gem 'rack-livereload'
end

group :production do
  gem 'uglifier'
end

group :development do
  gem 'guard-livereload'
  gem 'rb-fsevent', require: false
  gem 'foreman'
  gem 'pry'
end
