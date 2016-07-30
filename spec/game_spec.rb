require 'game'

RSpec.describe Game do

  let (:game) { Game.new }
  
  describe "#score" do
    it "returns 0 if no pins have been knocked down in the game" do
      roll_same_score(20, 0)
      expect(game.score).to eq(0)
    end
  end
  
  it "returns 20 if each roll knocked down 1 pin" do
    roll_same_score(20, 1)
    expect(game.score).to eq(20)
  end

  # it "returns 29 if one frame was a spare and the rest downed 1 pin" do
  #   game.roll(5) 
  #   game.roll(5)
  #   roll_same_score(18, 1)
  #   expect(game.score).to eq(29)
  # end

  def roll_same_score(rolls, pins)
    rolls.times { game.roll(pins) }
  end
end
