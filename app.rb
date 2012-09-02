#!/usr/bin/env ruby
require 'bundler'
Bundler.require

require 'eventmachine'
require 'em-http-request'

EventMachine.run {
  http = EventMachine::HttpRequest.new("ws://localhost:9292/device").get :timeout => 0
  http.errback { puts "oops" }
  http.callback {
      puts "WebSocket connected!"
      http.send('identify')
  }
  http.stream { |msg|
      puts "Recieved: #{msg}"
  }
}