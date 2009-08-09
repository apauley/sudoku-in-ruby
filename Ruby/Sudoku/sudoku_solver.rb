require 'sudoku_algorithm'

class SudokuSolver
  def SudokuSolver.algorithms
    {"trial_and_error" => RecursiveTrialAndErrorAlgorithm}
  end

  def initialize(puzzle, algorithm_to_use="trial_and_error")
    @algorithm = self.class.algorithms[algorithm_to_use]
    freeze
  end

  def solve(puzzle)
    results = {}
    results['start_time'] = Time.now
    results['puzzle'] = @algorithm.new(puzzle).solve
    results['end_time'] = Time.now
    results['elapsed_time'] = results['end_time'] - results['start_time']
    return results
  end
end
