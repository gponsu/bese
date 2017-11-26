require 'socket'
require_relative 'database'

server = TCPServer.new('0.0.0.0', 3305)
database = Database.new

loop do
  Thread.start(server.accept) do |client|
    msg = client.gets.chomp

    if msg === 'GET'
      client.puts database.trades
    else
      database.save(msg)
    end

    client.close
  end
end
