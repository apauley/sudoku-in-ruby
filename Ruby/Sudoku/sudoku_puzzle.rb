require 'matrix'

class SudokuPuzzle
  def initialize(grid_size=9)
    @grid_size = grid_size
  end

  def grid
    Matrix.I(@grid_size)
  end
end
