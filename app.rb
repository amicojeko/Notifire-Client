#!/usr/bin/env ruby
require 'bundler/setup'
require 'SocketIO'

host = 'aqueous-sea-6000.herokuapp.com'
port = 5000
client = SocketIO.connect("http://#{host}:#{port}") do
  before_start do
    on_message do |message|
      puts "incoming message: #{message}"
    end
    on_event 'news' do |data|
      puts data.first # data is an array fo things.
    end
  end
end