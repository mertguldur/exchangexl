require 'rubygems'
require 'bundler'

Bundler.require

require './app'

use Rack::Coffee, root: 'public', urls: '/javascripts'
run App
