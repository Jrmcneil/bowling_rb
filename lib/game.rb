class Game

  def initialize
    @completed_rolls = []
  end

  def roll(pins)
    @completed_rolls.push(pins)
  end

  def score
    frame_scores.reduce(:+)
  end
  
  private
  
  def frame_scores
      frame_first_rolls.map(&frame_score) 
  end
  
  def frame_first_rolls
      @completed_rolls.each_with_index 
                      .select {|roll, index| index % 2 == 0}
  end

  def frame_score
    Proc.new do |roll, index|
      next_roll, subsequent_roll = @completed_rolls[index + 1, index + 2]
      score = roll + next_roll 
      score += subsequent_roll if score == 10
      score
    end
  end
end
