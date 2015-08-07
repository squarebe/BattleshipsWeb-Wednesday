require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/battleships_web.rb')
require './app'
run Sinatra::Application
run BattleshipsWeb