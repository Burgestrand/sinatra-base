#!/usr/bin/env rackup

require File.expand_path('./web', File.dirname(__FILE__))
$stdout.sync = development?

map '/assets' do
  run Sinatra::Application.sprockets
end

map '/' do
  run Sinatra::Application
end
