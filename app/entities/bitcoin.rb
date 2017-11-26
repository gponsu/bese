module Bitcoin
  Entity = Struct.new(:price, :change) do
    def falling?
      change < 0
    end
  end
end
