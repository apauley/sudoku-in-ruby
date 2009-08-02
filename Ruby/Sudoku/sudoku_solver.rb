require 'sudoku_algorithm'

class SudokuSolver
  def initialize(puzzle)
    @try_your_luck = TryYourLuckAlgorithm.new(puzzle)
    freeze
  end

  def solve
    @try_your_luck.solve
  end
end
