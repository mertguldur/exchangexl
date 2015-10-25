require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra/assetpack'
require './app'

run App
