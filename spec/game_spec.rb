require 'game'

RSpec.describe Game do

  let (:game) { Game.new }
  
  describe "#score" do
    it "returns 0 if no pins have been knocked down in the game" do
      20.times { game.roll(0) }
      expect(game.score).to eq(0)
    end
  end
  
  it "returns 20 if each roll knocked down 1 pin" do
    20.times { game.roll(1) }
    expect(game.score).to eq(20)
  end

 # it "returns 29 if one frame was a spare and the rest downed 1 pin" do
 #   
 # end

  def roll_same_score(rolls, pins)
    rolls.times { game.roll(pins) }
  end
end
