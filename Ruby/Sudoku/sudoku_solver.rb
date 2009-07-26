class SudokuSolver
  def initialize(puzzle)
    @puzzle = puzzle
    freeze
  end

  def improve_grid_component(an_array)
    component_without_zeros = an_array.select {|each| each != 0}
    if (@puzzle.size - component_without_zeros.size) > 1
      return an_array
    end

    new_component = []
    an_array.each {|x|
      if x == 0
        sum = @puzzle.sum(an_array)
        new_component.push(@puzzle.component_total - sum)
      else
        new_component.push(x)
      end
    }
    return new_component
  end

  def improve_components(an_array)
    improved_components = []
    an_array.each {|component|
      new_component = improve_grid_component(component)
      improved_components.push(new_component)
    }
    return improved_components
  end

  def solve
    if @puzzle.solved?
      return @puzzle
    end

    improved_rows = improve_components(@puzzle.rows)
    improved_puzzle = SudokuPuzzle.new(improved_rows)

    improved_columns = improve_components(improved_puzzle.columns)
    improved_puzzle = SudokuPuzzle.columns(improved_columns)

    if improved_puzzle == @puzzle
      return @puzzle
    else
      return self.class.new(improved_puzzle).solve
    end
  end
end
