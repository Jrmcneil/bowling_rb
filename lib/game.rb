class Game
  attr_accessor :cumulative_score

  def initialize
    @cumulative_score = 0
  end

  def roll(pins)
    @cumulative_score += pins
  end

  def score
    @cumulative_score
  end
end
