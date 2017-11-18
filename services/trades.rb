require_relative '../entities/trade/entity'
require_relative '../entities/trade/repository'

module Trades
  extend self

  def create(params)
    cost = params['cost'].to_f
    price =  params['price'].to_f
    trade = Trade::Entity.new(cost, price)

    repository.save(trade)
  end

  def retrieve
    repository.find_all
  end

  private

  def repository
    @repository ||= Trade::Repository.new
  end
end
