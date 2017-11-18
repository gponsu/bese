require_relative 'bitcoin_quote'
require_relative 'trades'

module Balances
  extend self

  def retrieve
    return 0 if trades.empty?

    price * volume - cost
  end

  private

  def trades
    Trades.retrieve
  end

  def price
    BitcoinQuote.retrieve.price
  end

  def volume
    trades.sum(&:volume)
  end

  def cost
    trades.sum(&:cost)
  end
end
