require 'sudoku_algorithm'

class SudokuSolver
  def initialize
    freeze
  end

  def solve(puzzle)
    try_your_luck = TryYourLuckAlgorithm.new(puzzle)
    return try_your_luck.solve
  end
end
