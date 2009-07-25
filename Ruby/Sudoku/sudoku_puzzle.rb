require 'matrix'

class SudokuPuzzle
  def initialize(grid_rows)
    @grid = Matrix[*grid_rows]
    validate
  end

  def validate
    if not @grid.square?
      raise
    end
    validate_entries(@grid.to_a)
  end

  def validate_entries(an_array)
    for i in 0...an_array.length
      for j in 0...an_array[i].length
        if an_array[i][j] > size
          raise
        end
      end
    end
  end

  def ==(anotherObject)
    grid == anotherObject.grid
  end

  def size
    grid.row_size()
  end

  def grid
    @grid
  end
end
