module Trade
  module Storage
    class Memory
      def initialize
        @store = []
      end

      def save(trade)
        @store << trade
      end

      def trades
        @store
      end
    end
  end
end
