#!/usr/bin/env ruby
require 'bundler/setup'
require 'SocketIO'

host = 'localhost'
port = 5000

connected = false

client = SocketIO.connect("http://#{host}:#{port}") do
  before_start do
    on_connect do
      connected = true
      puts "[STATUS] connection established"
    end
    on_message do |message|
      puts "incoming message: #{message}"
    end
    on_event 'news' do |data|
      puts data.first # data is an array fo things.
    end
    on_error do
      puts 'error'
    end
  end
end

connected = false
puts "[STATUS] connection lost"