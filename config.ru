path = File.expand_path "../", __FILE__

require 'rubygems'
require 'sinatra'
require "#{path}/app.rb"

run Sinatra::Application
