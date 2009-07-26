class SudokuSolver
  def initialize(puzzle)
    @puzzle = puzzle
    freeze
  end

  def improve_grid_component(an_array)
    sum = @puzzle.sum(an_array)

    if (sum == 0) and (an_array.size > 1)
      return an_array
    end

    new_component = []
    an_array.each {|x|
      if x == 0
        new_component.push(@puzzle.component_total - sum)
      else
        new_component.push(x)
      end
    }
    return new_component
  end

  def solve
    if @puzzle.solved?
      return @puzzle
    end

    improved_rows = []
    @puzzle.rows.each {|row|
      new_row = improve_grid_component(row)
      improved_rows.push(new_row)
    }
    return SudokuPuzzle.new(improved_rows)
  end
end
