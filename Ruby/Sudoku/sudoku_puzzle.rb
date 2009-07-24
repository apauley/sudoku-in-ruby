require 'matrix'

class SudokuPuzzle
  def initialize(grid_size=9)
    @grid = Matrix.I(grid_size)
  end

  def grid
    @grid
  end
end
