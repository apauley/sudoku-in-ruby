require 'algorithm'
require 'sudoku_puzzle'

class TrialAndErrorAlgorithm < SudokuAlgorithm
  def TrialAndErrorAlgorithm.improve_component(an_array, element)
    if pos = an_array.index(0)
      an_array[pos] = element
    end
    return an_array
  end

  def solve
    if @puzzle.solved?
      return self
    end
    luckyrows = @puzzle.rows.clone
    if pos = incomplete_component_index(luckyrows)
      incomplete_row = luckyrows[pos]

      available_elements = (1..@puzzle.size).to_a
      puzzle_to_try = SudokuPuzzle.new(luckyrows)
      luckypuzzle = try_luck_with(available_elements, puzzle_to_try, @puzzle).puzzle
      return self.class.new(luckypuzzle).solve
    end
  end

  def TrialAndErrorAlgorithm.try_luck_with(elements, puzzle, initial_puzzle)
    if elements.empty?
      # I raised a RuntimeError to see why elements were sometimes empty,
      # and then everything suddenly worked. Weird.
      raise NoElementError, 'No elements!'
    end

    luckyrows = puzzle.rows.clone
    if (pos = incomplete_component_index(luckyrows))
      incomplete_row = luckyrows[pos].clone
      begin
        luckyrow = self.class.improve_component(incomplete_row, elements.first)
        luckyrows[pos] = luckyrow

        luckypuzzle = initial_puzzle.cloneWithRows(luckyrows)
        return self.class.new(luckypuzzle).solve
      rescue SudokuError => detail
        elements.delete_at(0)
        return try_luck_with(elements, puzzle, initial_puzzle)
      end
    end
  end

  def incomplete_component_index(an_array)
    an_array.each_with_index {|each, index|
      if @puzzle.sum(each) < @puzzle.component_total
        return index
      end
    }
  end
end
