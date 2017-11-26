require 'socket'

module Trade
  module Storage
    class Database
      def save(trade)
        TCPSocket.open(ENV['STORAGE_HOST'], ENV['STORAGE_PORT']) do |storage|
          storage.puts(trade)
        end
      end

      def trades
        TCPSocket.open(ENV['STORAGE_HOST'], ENV['STORAGE_PORT']) do |storage|
          trades = []

          storage.puts('GET')

          while trade = storage.gets
            trades << trade
          end

          trades
        end
      end
    end
  end
end
