ENV["APP_NAME"] = "rake"
require_relative "boot"

desc "Runs the application console"
task :console do
  env = { "RACK_ENV" => "development" }
  exec(env, "pry -r./web -e 'cd Sinatra::Application.new!'")
end
