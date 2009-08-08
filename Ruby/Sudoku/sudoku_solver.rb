require 'sudoku_algorithm'

class SudokuSolver
  def SudokuSolver.algorithms
    {"try_your_luck" => RecursiveTrialAndErrorAlgorithm}
  end

  def initialize(algorithm_to_use="try_your_luck")
    @algorithm_to_use = algorithm_to_use
    freeze
  end

  def solve(puzzle)
    algorithm = self.class.algorithms[@algorithm_to_use]
    return algorithm.new(puzzle).solve
  end
end
