# Utility
class MissingConfigurationError < StandardError
end

def env(name)
  ENV.fetch(name) do
    raise MissingConfigurationError, "ENV[#{name}] is not set"
  end
end

#
# Application
#
$app  = env('APP_NAME').to_sym # allows workers/etc to use same boot
$env  = env('RACK_ENV').to_sym # actual environment name
$root = File.dirname(__FILE__) # application root path
$LOAD_PATH.unshift($root)

require 'bundler'
Bundler.require(:default, $app, $env, "#{$app}_#{$env}")

#
# Gem configuration
#

# You may switch on $app here to configure gems dependent on
# which application you are running. You might as well do it
# in the application itself, though.
