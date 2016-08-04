class Game
  
  FRAMES_RANGE = 0..9

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
      frame_first_rolls[FRAMES_RANGE].map(&frame_score) 
  end
  
  def frame_score
    Proc.new do |roll, index|
      next_roll, subsequent_roll = @completed_rolls[index + 1, index + 2]
      score = roll + next_roll 
      score = (score >= 10) ? score + subsequent_roll : score
    end
  end

  def frame_first_rolls
      @completed_rolls.each_with_index
                      .select(&identify_first_rolls)
  end
  
  def identify_first_rolls
    first_roll_is_even = true
    Proc.new do |roll, index|
      if ((index % 2 === 0) === first_roll_is_even)
        first_roll_is_even = !first_roll_is_even if roll == 10 
        true
      end
    end
  end
end
