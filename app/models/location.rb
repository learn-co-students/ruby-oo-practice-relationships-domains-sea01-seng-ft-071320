class Location
  attr_reader :location

  @@all = []

  def initialize(location)
    @location = location

    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Instance methods for returning data
  def contracts
    Contract.all.select { |contract| contract.location == self }
  end

  def workouts
    WorkOut.all.select { |workout| workout.location == self }
  end

  def trainers
    contracts.map(&:trainer)
  end

  def clients
    workouts.map(&:client).uniq
  end

  def num_clients
    clients.length
  end

  #Class methods for aggregating data
  def self.least_clients
    all.max_by(&:num_clients)
  end
end