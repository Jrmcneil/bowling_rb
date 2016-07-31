class Game
  attr_accessor :completed_roles

  def initialize
    @completed_rolls = []
  end

  def roll(pins)
    @completed_rolls.push(pins)
  end

  def score
    frames = []
    @completed_rolls.each_with_index do |roll, index| 
      if index % 2 == 0
        frame_score = get_frame_score(roll, @completed_rolls[index + 1], @completed_rolls[index + 2])
        frames.push(frame_score)
      end
    end
    frames.reduce(:+)
  end

  def get_frame_score(roll, next_roll, subsequent_roll)
    frame_score = roll + next_roll 
    frame_score += subsequent_roll if frame_score == 10
    frame_score
  end
end
