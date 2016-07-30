require 'game'

RSpec.describe Game do
  describe "#score" do
    it "returns 0 if no pins have been knocked down in the game" do
      game = Game.new
      20.times { game.roll(0) }
      expect(game.score).to eq(0)
    end
  end
  
  it "returns 20 if each roll knocked down 1 pin" do
    game = Game.new
    20.times { game.roll(1) }
    expect(game.score).to eq(20)
  end
end
