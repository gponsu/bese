module Trade
  Entity = Struct.new(:cost, :price) do
    def volume
      cost / price
    end
  end
end
