class GameOfLife
  DEAD_CELL = "."
  LIVING_CELL = "#"
  attr_accessor :no_columns, :no_rows, :life_board

  def initialize(no_rows = 3, no_columns = 3)
    @no_rows = no_rows
    @no_columns = no_columns
    @life_board = initializeGridWithDeadCells

    # @x_range = 0...@no_columns
    # @y_range = 0...@no_rows
  end

  def traverse_cells
    (0...@no_rows).each do |row|
      (0...@no_columns).each do |column|
        yield row, column, @life_board[row][column]
      end
    end
  end

  def initializeGridWithDeadCells
    new_board = Array.new(no_rows) do
      build_columns = Array.new(no_columns, DEAD_CELL)
      build_columns
    end
    new_board
  end

  def setLivingCell(*points)
    points.each do |point|
      @life_board[point[0]][point[1]] = LIVING_CELL
    end
  end

  def countLivingNeighbourCell(row, column)
    cellsToCheck = [
      [row - 1, column - 1],
      [row - 1, column],
      [row - 1, column + 1],
      [row, column + 1],
      [row + 1, column + 1],
      [row + 1, column],
      [row + 1, column  - 1],
      [row, column - 1],
  ]
    livingneighbours = 0
    cellsToCheck.each do |cell|
      if cellInGrid(cell[0],cell[1]) && alive?(cell[0],cell[1])
        livingneighbours += 1
      end
    end
    livingneighbours
  end

  def cellInGrid(row, col)
    row_valid = row >= 0 && row < @no_rows
    col_valid = col >= 0 && col < @no_columns
    row_valid && col_valid && @life_board[row][col].class == String
  end

  def alive?(row,col)
    @life_board[row][col] == "#"
  end

  def dead?(row,col)
    @life_board[row][col] == "."
  end

  def underpopulation?(row,col)
    countLivingNeighbourCell(row, col) < 2
  end

  def overcrowding?(row,col)
    countLivingNeighbourCell(row, col) > 3
  end

  def willLive?(row, col)
    (countLivingNeighbourCell(row, col) == 3 || countLivingNeighbourCell(row, col) == 2) && alive?(row,col)
  end

  def resurrect?(row, col)
    countLivingNeighbourCell(row, col) == 3 && dead?(row,col)
  end

  def computeNextGeneration
    nextBoard = initializeGridWithDeadCells
    @life_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        if underpopulation?(row_index, column_index)
          nextBoard[row_index][column_index] = DEAD_CELL
        elsif willLive?(row_index, column_index)
          nextBoard[row_index][column_index] = LIVING_CELL
        elsif overcrowding?(row_index, column_index)
          nextBoard[row_index][column_index] = DEAD_CELL
        elsif resurrect?(row_index, column_index)
          nextBoard[row_index][column_index] = LIVING_CELL
        else
          nextBoard[row_index][column_index] = @life_board[row_index][column_index]
        end
      end
    end
    @life_board = nextBoard
  end


end