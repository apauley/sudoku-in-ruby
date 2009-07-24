require 'matrix'

class SudokuPuzzle
  def initialize(grid_rows=nil)
    @grid = Matrix.I(grid_size)
  end

  def grid
    @grid
  end
end
