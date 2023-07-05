require "game-of-life"

RSpec.describe GameOfLife do

    it "has a columns count" do
      game = GameOfLife.new
      game.no_columns = 10
      expect(game.no_columns).to eq(10)
    end

    it "has a rows count" do
      game = GameOfLife.new
      game.no_rows = 10
      expect(game.no_rows).to eq(10)
    end

    it "row and column count specified by user" do
      game = GameOfLife.new(10,10)
      expect(game.no_rows).to eq 10
      expect(game.no_columns).to eq 10
    end

    it "build a dead cell grid" do
      game = GameOfLife.new(10,10)
      expected = [
	   		[".",".",".",".",".",".",".",".",".","."],
	  		[".",".",".",".",".",".",".",".",".","."],
	   		[".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
      ]
      expect(game.initializeGridWithDeadCells).to eq expected
    end

    it "build a grid with some live cell" do
      game = GameOfLife.new(10,10)
      expected = [
	   		["#","#",".",".",".",".",".",".",".","."],
	  		[".",".",".",".",".",".",".",".",".","."],
	   		[".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
      ]
      game.setLivingCell([0,0], [0,1])
      expect(game.grid_array).to eq expected
    end

    it "check for 1 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	["#","#",".",".",".",".",".",".",".","."],
	  	# 	[".",".",".",".",".",".",".",".",".","."],
	   	# 	[".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([0,0], [0,1])
      expect(game.countLivingNeighbourCell(0,2)).to eq 1
    end

    it "check for 2 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	["#","#",".",".",".",".",".",".",".","."],
	  	# 	[".",".",".",".",".",".",".",".",".","."],
	   	# 	[".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([0,0], [0,1])
      expect(game.countLivingNeighbourCell(1,1)).to eq 2
    end

    it "check for 3 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	[".",".",".",".",".",".",".",".",".","."],
	  	# 	[".","#","#",".",".",".",".",".",".","."],
	   	# 	[".","#",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([1,1], [2,1], [1,2])
      expect(game.countLivingNeighbourCell(2,2)).to eq 3
    end

    it "check for 4 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	[".",".",".",".",".",".",".",".",".","."],
	  	# 	[".","#","#",".",".",".",".",".",".","."],
	   	# 	[".","#",".",".",".",".",".",".",".","."],
      #   [".",".",".","#",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([1,1], [2,1], [1,2],[3,3])
      expect(game.countLivingNeighbourCell(2,2)).to eq 4
    end

    it "check for 5 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	[".",".",".",".",".",".",".",".",".","."],
	  	# 	[".","#","#",".",".",".",".",".",".","."],
	   	# 	[".","#",".",".",".",".",".",".",".","."],
      #   [".",".","#","#",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([1,1], [2,1], [1,2],[3,3], [2,3])
      expect(game.countLivingNeighbourCell(2,2)).to eq 5
    end

    it "check for 6 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	[".",".",".",".",".",".",".",".",".","."],
	  	# 	[".","#","#",".",".",".",".",".",".","."],
	   	# 	[".","#",".",".",".",".",".",".",".","."],
      #   [".","#","#","#",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([1,1], [2,1], [1,2],[3,3], [2,3], [1,3])
      expect(game.countLivingNeighbourCell(2,2)).to eq 6
    end

    it "check for 7 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	[".",".",".",".",".",".",".",".",".","."],
	  	# 	[".","#","#",".",".",".",".",".",".","."],
	   	# 	[".","#",".","#",".",".",".",".",".","."],
      #   [".","#","#","#",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([1,1], [2,1], [1,2],[3,3], [2,3], [1,3], [3,2])
      expect(game.countLivingNeighbourCell(2,2)).to eq 7
    end

    it "check for 7 neighbouring living cell" do
      game = GameOfLife.new(10,10)
      # expected = [
	   	# 	[".",".",".",".",".",".",".",".",".","."],
	  	# 	[".","#","#","#",".",".",".",".",".","."],
	   	# 	[".","#",".","#",".",".",".",".",".","."],
      #   [".","#","#","#",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      #   [".",".",".",".",".",".",".",".",".","."],
      # ]
      game.setLivingCell([1,1], [2,1], [1,2],[3,3], [2,3], [1,3], [3,2], [3,1])
      expect(game.countLivingNeighbourCell(2,2)).to eq 8
    end



end