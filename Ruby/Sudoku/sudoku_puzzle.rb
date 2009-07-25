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
    validate_entries
  end

  def validate_entries
    grid.to_a.each {|x|
      x.each {|y|
        if y > size
          raise
        end
      }
    }
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

  def solved?
    grid.to_a.each {|x|
      x.each {|y|
        if y == 0
          return false
        end
      }
    }
    return true
  end
end
