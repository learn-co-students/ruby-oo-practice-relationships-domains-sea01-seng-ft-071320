class Trainer
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name

    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Instance methods for returning data
  def clients
    Client.all.select { |client| client.trainer == self }
  end

  def num_clients
    clients.length
  end

  def contracts
    Contract.all.select { |contract| contract.trainer == self }
  end

  def locations
    contracts.map(&:location)
  end

  #Class methods for aggregating data
  def self.most_clients
    all.max_by(&:num_clients)
  end
end