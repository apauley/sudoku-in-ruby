class SudokuAlgorithm
  def initialize(puzzle)
    @puzzle = puzzle
    freeze
  end

  def solve
    raise 'Please implement this method in a subclass'
  end
end

class TryYourLuckAlgorithm < SudokuAlgorithm
  def solve
    if @puzzle.solved?
      return @puzzle
    end
    luckyrows = @puzzle.rows.clone
    if pos = incomplete_component_index(luckyrows)
      incomplete_row = luckyrows[pos]

      available_elements = (1..@puzzle.size).to_a - incomplete_row.uniq
      luckypuzzle = try_luck_with(available_elements, luckyrows)
      return self.class.new(luckypuzzle).solve
    end
  end

  def try_luck_with(elements, puzzlerows)
    if elements.empty?
      raise 'No elements!'
    end

    luckyrows = puzzlerows.clone
    if (pos = incomplete_component_index(luckyrows))
      incomplete_row = luckyrows[pos].clone
      begin
        luckyrow = improve_component(incomplete_row, elements.first).clone
        luckyrows[pos] = luckyrow.clone

        luckypuzzle = SudokuPuzzle.new(luckyrows.clone)
        return self.class.new(luckypuzzle).solve
      rescue RuntimeError => detail
        elements.delete_at(0)
        return try_luck_with(elements, puzzlerows)
      end
    end
  end

  def incomplete_component_index(an_array)
    an_array.each_with_index {|each, index|
      if @puzzle.sum(each) < @puzzle.component_total
        return index
      end
    }
    return nil
  end

  def improve_component(an_array, element)
    if pos = an_array.index(0)
      an_array[pos] = element
    end
    return an_array
  end
end

class CompleteLastRemainingAlgorithm < SudokuAlgorithm
  def fill_remaining_element(an_array)
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

  def fill_components(an_array)
    improved_components = []
    an_array.each {|component|
      new_component = fill_remaining_element(component)
      improved_components.push(new_component)
    }
    return improved_components
  end

  def solve
    if @puzzle.solved?
      return @puzzle
    end

    improved_rows = fill_components(@puzzle.rows)
    improved_puzzle = SudokuPuzzle.new(improved_rows)

    improved_columns = fill_components(improved_puzzle.columns)
    improved_puzzle = SudokuPuzzle.columns(improved_columns)

    if improved_puzzle == @puzzle
      return @puzzle
    else
      return self.class.new(improved_puzzle).solve
    end
  end
end
