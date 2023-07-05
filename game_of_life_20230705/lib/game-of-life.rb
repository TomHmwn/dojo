class GameOfLife
  DEADCELL = "."
  LIVINGCELL = "#"
  attr_accessor :no_columns, :no_rows, :grid_array

  def initialize(no_rows = 3, no_columns = 3)
    @no_rows = no_rows
    @no_columns = no_columns
    initializeGridWithDeadCells
  end

  def initializeGridWithDeadCells
    @grid_array = Array.new(no_rows) do
      build_columns = Array.new(no_columns, DEADCELL)
    end
  end

  def setLivingCell(*points)
    points.each do |point|
      @grid_array[point[0]][point[1]] = LIVINGCELL
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
      if cellInGrid(cell[0],cell[1]) && Alive?(cell[0],cell[1])
        livingneighbours += 1
      end
    end
    livingneighbours
  end

  def cellInGrid(row, col)
    @grid_array[row][col].class == String
  end

  def Alive?(row,col)
    @grid_array[row][col] == "#"
  end
end