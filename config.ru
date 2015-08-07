require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/battleships_web.rb')
require './app'
run BattleshipsWeb

run Sinatra::Application