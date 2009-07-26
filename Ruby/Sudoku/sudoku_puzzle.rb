require 'matrix'
require 'sudoku_cell'

class SudokuPuzzle
  def initialize(grid_rows)
    @grid = Matrix[*grid_rows]
    freeze
    validate
  end

  def validate
    validate_grid
    validate_entries
    validate_no_duplicates(rows)
    validate_no_duplicates(columns)
  end

  def validate_grid
    if not @grid.square?
      raise
    end
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

  def validate_no_duplicates(an_array)
    an_array.each {|list|
      list_without_zeros = list.select {|each| each != 0}
      if list_without_zeros.uniq != list_without_zeros
        raise
      end
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

  def rows
    return @grid.row_vectors.collect {|each| each.to_a}
  end

  def columns
    return @grid.column_vectors.collect {|each| each.to_a}
  end

  def cell(row_index, column_index)
    cell_value = @grid[row_index-1, column_index-1]
    return SudokuCell.new(cell_value)
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
