class Game
  attr_accessor :completed_roles

  def initialize
    @completed_rolls = []
  end

  def roll(pins)
    @completed_rolls.push(pins)
  end

  def score
    @completed_rolls.to_enum.reduce(:+)
  end
end
