require 'yaml/store'

class Database
  def initialize
    create_database
    load_database
  end

  def save(trade)
    @store.transaction do
      @store['trades'] << trade
    end
  end

  def trades
    @store.transaction do
      @store['trades']
    end
  end

  private

  def create_database
    path = '/usr/local/databases'

    Dir.mkdir(path) unless File.exists?(path)
    @store = YAML::Store.new "#{path}/trades.store"
  end

  def load_database
    @store.transaction do
      @store['trades'] = [] unless @store['trades']
    end
  end
end
