require 'net/http'
require 'json'
require_relative '../entities/bitcoin'

module BitcoinQuote
  extend self

  def retrieve
    quote = find_quote
    price = quote[:price_usd]
    change = quote[:percent_change_24h]

    Bitcoin::Entity.new(price, change)
  end

  private

  def find_quote
    url = URI('https://api.pro.coinbase.com/products/BTC-USD/stats')
    response = Net::HTTP.get(url)
    parse(response)
  end

  def parse(response)
    parsed = JSON.parse(response, symbolize_names: true)
    percent_change_24h = ((parsed[:last].to_f - parsed[:open].to_f)/parsed[:open].to_f*100).round(2)

    {
      price_usd: parsed[:last].to_f,
      percent_change_24h: percent_change_24h
    }
  end
end
