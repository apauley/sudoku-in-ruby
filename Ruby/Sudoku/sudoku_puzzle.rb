require 'matrix'
require 'sudoku_cell'

class SudokuPuzzle
  def SudokuPuzzle.columns(grid_columns)
    matrix = Matrix.columns(grid_columns)
    return SudokuPuzzle.new(matrix.to_a)
  end

  def SudokuPuzzle.empty(puzzle_size)
    matrix = Matrix.zero(puzzle_size)
    return SudokuPuzzle.new(matrix.to_a)
  end

  def initialize(grid_rows)
    @grid = Matrix[*grid_rows]
    freeze
    puts self.to_s
    validate
  end

  def to_s
    grid_s = (rows.collect {|row| row.to_s + "\n"}).to_s + "\n"
    preamble = size.to_s + "x" + size.to_s + " puzzle:\n"
    return preamble + grid_s
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
    grid.to_a.flatten.each {|x|
      if x > size
        #FIXME: Ruby string interpolation?
        msg = "Invalid entry " + x.to_s + " for puzzle with size " + size.to_s
        raise msg
      end
    }
  end

  def validate_no_duplicates(an_array)
    an_array.each {|list|
      list.delete(0)
      if list.uniq != list
        raise 'Duplicates in component ' + an_array.to_s + ' for ' + self.to_s
      end}
  end

  def ==(anotherObject)
    grid == anotherObject.grid
  end

  def size
    grid.row_size()
  end

  def sum(an_array)
    # FIXME: How do you sum a list of numbers idiomatically?
    total = 0
    an_array.each {|x| total = total + x}
    return total
  end

  def component_total
    sum((1...size+1).to_a)
  end

  def grid
    @grid
  end

  def rows
    return grid.row_vectors.collect {|each| each.to_a}
  end

  def columns
    return grid.column_vectors.collect {|each| each.to_a}
  end

  def square?
    x = Math.sqrt(size)
    return (x.to_i == x)
  end

  def block_size
    if square?
      return Math.sqrt(size)
    else
      return 1
    end
  end

  def blocks
    b = []
    b.push(@grid[0, 0..1]+@grid[1, 0..1])
    b.push(@grid[0, 2..3]+@grid[1, 2..3])
    b.push(@grid[2, 0..1]+@grid[3, 0..1])
    b.push(@grid[2, 2..3]+@grid[3, 2..3])
    return b
  end

  def cell(row_index, column_index)
    cell_value = @grid[row_index-1, column_index-1]
    return SudokuCell.new(cell_value)
  end

  def solved?
    row_totals = rows.collect {|each| sum(each) }
    column_totals = columns.collect {|each| sum(each) }
    uniq_totals = row_totals|column_totals

    return ((uniq_totals.size == 1) and (sum(uniq_totals) == component_total))
  end
end
