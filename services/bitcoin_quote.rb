require 'net/http'
require 'json'
require_relative '../entities/bitcoin'

module BitcoinQuote
  extend self

  def retrieve
    quote = find_quote
    price = quote['price_usd'].to_f
    change = quote['percent_change_24h'].to_f

    Bitcoin::Entity.new(price, change)
  end

  private

  def find_quote
    url = URI('https://api.coinmarketcap.com/v1/ticker/bitcoin/')
    response = Net::HTTP.get(url)
    JSON.parse(response).first
  end
end
