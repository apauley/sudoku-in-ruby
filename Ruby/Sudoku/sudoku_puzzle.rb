require 'matrix'

class SudokuPuzzle
  def initialize(grid_rows)
    @grid = Matrix[*grid_rows]
  end

  def grid
    @grid
  end
end
