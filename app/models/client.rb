class Client
  attr_reader :name, :trainer

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

  #Instance methods for assigning data
  def assign_trainer(trainer)
    @trainer = trainer
  end
end