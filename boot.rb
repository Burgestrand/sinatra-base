def config_env(name, default = nil)
  ENV.fetch(name) { default or raise "ENV[#{name}] is not set" }
end

#
# Application
#
$app  = config_env('APP_NAME').to_sym # allows workers/etc to use same boot
$env  = config_env('RACK_ENV', 'development').to_sym # actual environment name
$root = File.dirname(__FILE__) # application root path
$LOAD_PATH.unshift($root)

require 'bundler'
Bundler.require(:default, $app, $env, "#{$app}_#{$env}")
