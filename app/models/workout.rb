class WorkOut
  attr_reader :client, :location

  @@all = []

  def initialize(client, location)
    @client, @location = client, location

    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end