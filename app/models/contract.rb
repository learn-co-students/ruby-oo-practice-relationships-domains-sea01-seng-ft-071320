class Contract
  attr_reader :location, :trainer

  @@all = []

  def initialize(location, trainer)
    @location, @trainer = location, trainer

    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end