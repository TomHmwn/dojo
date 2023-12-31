# frozen_string_literal: true

require 'game-of-life'

RSpec.describe GameOfLife do
  it 'has a columns count' do
    game = GameOfLife.new
    game.no_columns = 10
    expect(game.no_columns).to eq(10)
  end

  it 'has a rows count' do
    game = GameOfLife.new
    game.no_rows = 10
    expect(game.no_rows).to eq(10)
  end

  it 'row and column count specified by user' do
    game = GameOfLife.new(10, 10)
    expect(game.no_rows).to eq 10
    expect(game.no_columns).to eq 10
  end

  it 'build a dead cell grid' do
    game = GameOfLife.new(10, 10)
    expected = [
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.']
    ]
    expect(game.initializeGridWithDeadCells).to eq expected
  end

  it 'build a grid with some live cell' do
    game = GameOfLife.new(10, 10)
    expected = [
      ['#', '#', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.']
    ]
    game.setLivingCell([0, 0], [0, 1])
    expect(game.life_board).to eq expected
  end

  it 'check for 1 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([0, 0], [0, 1])
    expect(game.countLivingNeighbourCell(0, 2)).to eq 1
  end

  it 'check for 2 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([0, 0], [0, 1])
    expect(game.countLivingNeighbourCell(1, 1)).to eq 2
  end

  it 'check for 3 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([1, 1], [2, 1], [1, 2])
    expect(game.countLivingNeighbourCell(2, 2)).to eq 3
  end

  it 'check for 4 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([1, 1], [2, 1], [1, 2], [3, 3])
    expect(game.countLivingNeighbourCell(2, 2)).to eq 4
  end

  it 'check for 5 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([1, 1], [2, 1], [1, 2], [3, 3], [2, 3])
    expect(game.countLivingNeighbourCell(2, 2)).to eq 5
  end

  it 'check for 6 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([1, 1], [2, 1], [1, 2], [3, 3], [2, 3], [1, 3])
    expect(game.countLivingNeighbourCell(2, 2)).to eq 6
  end

  it 'check for 7 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([1, 1], [2, 1], [1, 2], [3, 3], [2, 3], [1, 3], [3, 2])
    expect(game.countLivingNeighbourCell(2, 2)).to eq 7
  end

  it 'check for 7 neighbouring living cell' do
    game = GameOfLife.new(10, 10)
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
    game.setLivingCell([1, 1], [2, 1], [1, 2], [3, 3], [2, 3], [1, 3], [3, 2], [3, 1])
    expect(game.countLivingNeighbourCell(2, 2)).to eq 8
  end

  it 'check for 3 living neighbours at top left' do
    game = GameOfLife.new(10, 10)
    # expected = [
    # 	["#","#",".",".",".",".",".",".",".","."],
    # 	["#",".",".",".",".",".",".",".",".","."],
    # 	[".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    # ]
    game.setLivingCell([0, 0], [0, 1], [1, 0])
    expect(game.countLivingNeighbourCell(1, 1)).to eq 3
  end

  it 'check for 3 living neighbours at bottom left' do
    game = GameOfLife.new(10, 10)
    # expected = [
    # 	[".",".",".",".",".",".",".",".",".","."],
    # 	[".",".",".",".",".",".",".",".",".","."],
    # 	[".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   ["#",".",".",".",".",".",".",".",".","."],
    #   ["#","#",".",".",".",".",".",".",".","."],
    # ]
    game.setLivingCell([0, 9], [1, 9], [0, 8])
    expect(game.countLivingNeighbourCell(1, 8)).to eq 3
  end

  it 'check for 3 living neighbours at top right' do
    game = GameOfLife.new(10, 10)
    # expected = [
    # 	[".",".",".",".",".",".",".",".","#","#"],
    # 	[".",".",".",".",".",".",".",".",".","#"],
    # 	[".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    # ]
    game.setLivingCell([9, 0], [9, 1], [8, 0])
    expect(game.countLivingNeighbourCell(8, 1)).to eq 3
  end

  it 'check for 3 living neighbours at bottom right' do
    game = GameOfLife.new(10, 10)
    # expected = [
    # 	[".",".",".",".",".",".",".",".",".","."],
    # 	[".",".",".",".",".",".",".",".",".","."],
    # 	[".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","#"],
    #   [".",".",".",".",".",".",".",".","#","#"],
    # ]
    game.setLivingCell([9, 9], [8, 9], [9, 8])
    expect(game.countLivingNeighbourCell(8, 8)).to eq 3
  end

  it 'underpopulation/ cell fewer than 2 neighbour' do
    game = GameOfLife.new(10, 10)
    # expected = [
    # 	["#","#",".",".",".",".",".",".",".","."],
    # 	[".",".","?",".",".",".",".",".",".","."],
    # 	[".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    # ]
    game.setLivingCell([0, 0], [2, 1])
    expect(game.underpopulation?(2, 1)).to eq true
  end

  it 'overcrowding/ cell more than 3 neighbour' do
    game = GameOfLife.new(10, 10)
    # expected = [
    # 	["#","#",".",".",".",".",".",".",".","."],
    # 	["#","?",".",".",".",".",".",".",".","."],
    # 	["#",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    # ]
    game.setLivingCell([0, 0], [1, 0], [0, 1], [0, 2])
    expect(game.overcrowding?(1, 1)).to eq true
  end

  it 'cells with 2/3 neighbour' do
    game = GameOfLife.new(10, 10)
    expected = [
      ['#', '#', '#', '.', '.', '.', '.', '.', '.', '.'],
      ['#', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.']
    ]
    game.setLivingCell([0, 0], [1, 0], [0, 1], [2, 0])

    expect(game.willLive?(0, 0)).to eq true
    expect(game.willLive?(1, 0)).to eq true
    expect(game.willLive?(0, 1)).to eq true
    expect(game.willLive?(2, 0)).to eq false
  end

  it 'compute next generation' do
    game = GameOfLife.new(10, 10)

    # before = [
    # 	["#","#","#",".",".",".",".",".",".","."],
    # 	["#",".",".",".",".",".",".",".",".","."],
    # 	[".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","."],
    #   [".",".",".",".",".",".",".",".",".","#"],
    #   [".",".",".",".",".",".",".",".","#","#"],
    # ]
    expected = [
      ['#', '#', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['#', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '#', '#'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '#', '#']
    ]
    game.setLivingCell([0, 0], [1, 0], [0, 1], [2, 0], [8, 9], [9, 9], [9, 8])
    expect(game.computeNextGeneration).to eq expected
  end
end
