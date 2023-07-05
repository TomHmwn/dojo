require "game-of-life"

RSpec.describe LifeBoard do

    it "has a columns count" do
      game = LifeBoard.new
      game.no_columns = 10
      expect(game.no_columns).to eq(10)
    end

    it "has a rows count" do
      game = LifeBoard.new
      game.no_rows = 10
      expect(game.no_rows).to eq(10)
    end

    it "row and column count specified by user" do
      game = LifeBoard.new(10,10)
      expect(game.no_rows).to eq 10
      expect(game.no_columns).to eq 10
    end

    # it "build the grid based on the row and value count"
    #   game = LifeBoard.new(10,10)
    #   expect(game.no_rows).to eq 10

end