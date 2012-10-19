source :rubygems

ruby "1.9.3"

group :web, :rake do
  gem "sinatra"
  gem "sinatra-contrib", require: false
  gem "sinatra-support", require: "sinatra/support"
  gem "slim"

  gem "sprockets"
  gem "sprockets-helpers"
  gem "sprockets-sass"

  gem "uglifier"
  gem "compass"
  gem "coffee-script"
end

group :web_development do
  gem "rack-livereload"
  gem "guard-livereload"
  gem "rb-fsevent", require: false
end

group :development do
  gem "foreman"
  gem "pry"
end
