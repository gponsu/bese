require_relative 'storage/configuration'

module Trade
  class Repository
    def initialize
      @storage = Storage::Configuration.store
    end

    def find_all
      @storage.trades
    end

    def save(trade)
      @storage.save(trade)
    end
  end
end
