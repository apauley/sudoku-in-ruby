require 'sudoku_algorithm'

class SudokuSolver
  def SudokuSolver.algorithms
    {"trial_and_error" => RecursiveTrialAndErrorAlgorithm}
  end

  def initialize(puzzle, algorithm_to_use="trial_and_error")
    @start_time = Time.now
    @algorithm = self.class.algorithms[algorithm_to_use].new(puzzle)
    @crunched_puzzle = @algorithm.solve
    @end_time = Time.now
    freeze
  end

  def solve
    results = {}
    results['start_time'] = @start_time
    results['puzzle'] = @crunched_puzzle
    results['end_time'] = @end_time
    results['elapsed_time'] = elapsed_time
    return results
  end

  def elapsed_time
    @end_time - start_time
  end

  def start_time
    @start_time
  end
end
