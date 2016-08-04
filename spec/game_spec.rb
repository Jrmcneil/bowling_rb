require 'game'

RSpec.describe Game do

  let (:game) { Game.new }
  
  describe "#score" do
    it "returns 0 if no pins have been knocked down in the game" do
      roll_same_score(20, 0)
      expect(game.score).to eq(0)
    end
  
    it "returns 20 if each roll knocked down 1 pin" do
      roll_same_score(20, 1)
      expect(game.score).to eq(20)
    end

    it "returns 29 if one frame was a spare and the rest downed 1 pin", focus: true do
      roll_spare 
      roll_same_score(18, 1)
      expect(game.score).to eq(29)
    end
    
    it "returns 30 if one frame was a strike and the rest downed 1 pin" do
      roll_strike
      roll_same_score(18, 1)
      expect(game.score).to eq(30)
    end

    it "only counts the first 10 frames towards the score" do
      roll_strike
      roll_same_score(20, 1)
      expect(game.score).to eq(30)
    end
  end
  
  def roll_strike
    roll_same_score(1, 10)
  end

  def roll_same_score(rolls, pins)
    rolls.times { game.roll(pins) }
  end

  def roll_spare()
    2.times { game.roll(5) }
  end
end
