require 'sinatra'
require_relative 'services/bitcoin_quote'
require_relative 'services/trades'
require_relative 'services/balances'

configure do
  set :bind, '0.0.0.0'
end

before do
  @bitcoin = BitcoinQuote.retrieve
end

get '/' do
  @trades = Trades.retrieve
  @balances = Balances.retrieve

  erb :index
end

get '/new-trade' do
  erb :new_trade
end

post '/new-trade' do
  Trades.create(params)
  redirect to('/')
end
