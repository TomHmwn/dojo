# frozen_string_literal: true

class GameOfLife
  DEAD_CELL = '.'
  LIVING_CELL = '#'
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
    Array.new(no_rows) do
      Array.new(no_columns, DEAD_CELL)
    end
  end

  def setLivingCell(*points)
    points.each do |point|
      row = point[0]
      col = point[1]

      # Expand @life_board if necessary
      if row >= @no_rows
        (@no_rows...row + 1).each do |_r|
          @life_board << Array.new(@no_columns, DEAD_CELL)
        end
        @no_rows = row + 1
      end

      if col >= @no_columns
        @life_board.each do |row|
          row.concat(Array.new(col - @no_columns + 1, DEAD_CELL))
        end
        @no_columns = col + 1
      end

      # Set the living cell
      @life_board[row][col] = LIVING_CELL
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
      [row + 1, column - 1],
      [row, column - 1]
    ]
    livingneighbours = 0
    cellsToCheck.each do |cell|
      livingneighbours += 1 if cellInGrid(cell[0], cell[1]) && alive?(cell[0], cell[1])
    end
    livingneighbours
  end

  def cellInGrid(row, col)
    row_valid = row >= 0 && row < @no_rows
    col_valid = col >= 0 && col < @no_columns
    row_valid && col_valid && @life_board[row][col].instance_of?(String)
  end

  def alive?(row, col)
    @life_board[row][col] == '#'
  end

  def dead?(row, col)
    @life_board[row][col] == '.'
  end

  def underpopulation?(row, col)
    countLivingNeighbourCell(row, col) < 2
  end

  def overcrowding?(row, col)
    countLivingNeighbourCell(row, col) > 3
  end

  def willLive?(row, col)
    (countLivingNeighbourCell(row, col) == 3 || countLivingNeighbourCell(row, col) == 2) && alive?(row, col)
  end

  def resurrect?(row, col)
    countLivingNeighbourCell(row, col) == 3 && dead?(row, col)
  end

  def computeNextGeneration
    nextBoard = initializeGridWithDeadCells
    @life_board.each_with_index do |row, row_index|
      row.each_with_index do |_cell, column_index|
        nextBoard[row_index][column_index] = if underpopulation?(row_index, column_index)
                                               DEAD_CELL
                                             elsif willLive?(row_index, column_index)
                                               LIVING_CELL
                                             elsif overcrowding?(row_index, column_index)
                                               DEAD_CELL
                                             elsif resurrect?(row_index, column_index)
                                               LIVING_CELL
                                             else
                                               @life_board[row_index][column_index]
                                             end
      end
    end
    @life_board = nextBoard
  end
end
