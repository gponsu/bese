require 'json'
require_relative 'entity'
require_relative 'storage/configuration'

module Trade
  class Repository
    def initialize
      @storage = Storage::Configuration.store
    end

    def find_all
      @storage.trades.map do |trade|
        deserialize(trade)
      end
    end

    def save(trade)
      serialized = serialize(trade)
      @storage.save(serialized)
    end

    private

    def serialize(trade)
      trade
        .to_h
        .to_json
    end

    def deserialize(trade)
      cost, price = JSON.parse(trade).values_at('cost', 'price')
      Entity.new(cost, price)
    end
  end
end
