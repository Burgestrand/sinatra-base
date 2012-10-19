#!/usr/bin/env rackup

ENV["APP_NAME"] ||= "web"
require File.expand_path('./web', File.dirname(__FILE__))
$stdout.sync = development?

run Sinatra::Application
