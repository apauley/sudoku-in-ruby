require 'sudoku_algorithm'

class SudokuSolver
  def SudokuSolver.algorithms
    {"trial_and_error" => RecursiveTrialAndErrorAlgorithm}
  end

  def initialize(algorithm_to_use="trial_and_error")
    @algorithm_to_use = algorithm_to_use
    freeze
  end

  def solve(puzzle)
    results = {}
    algorithm = self.class.algorithms[@algorithm_to_use]
    results['start_time'] = Time.now
    results['puzzle'] = algorithm.new(puzzle).solve
    results['end_time'] = Time.now
    return results
  end
end
