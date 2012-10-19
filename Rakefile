ENV["APP_NAME"] = "rake"
require_relative "boot"

APP_FILE   = "web.rb"
APP_CLASS = "Sinatra::Application"
require "sinatra/assetpack/rake"

desc "Runs the application console"
task :console do
  env = { "RACK_ENV" => "development" }
  exec(env, "pry -r./web -e 'cd Sinatra::Application.new!'")
end
