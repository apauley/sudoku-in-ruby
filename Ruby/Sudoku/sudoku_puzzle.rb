require 'matrix'

class SudokuPuzzle
  def initialize(grid_rows)
    @grid = Matrix[*grid_rows]
    validate_grid()
  end

  def validate_grid
    if not @grid.square?
      raise
    end
  end

  def grid
    @grid
  end
end
