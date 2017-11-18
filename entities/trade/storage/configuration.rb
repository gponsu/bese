require_relative 'database'
require_relative 'memory'

module Trade
  module Storage
    class Configuration
      def self.store
        if ENV['RACK_ENV'] === 'test'
          Memory.new
        else
          Database.new
        end
      end
    end
  end
end
