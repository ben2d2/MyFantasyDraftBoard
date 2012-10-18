class Player
  attr_accessor :name, :age, :points, :ppg, :rank, :bye

  def initialize(array)
    self.rank = array[0]
    self.points = array[1]
    self.ppg = array[2]
    self.age = array[3]
    self.bye = array[4]
    self.name = array[5]
  end

  def to_a
    [rank, points, ppg, age, bye, name]
  end

end