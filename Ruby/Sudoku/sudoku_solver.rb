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

  def crunched_puzzle
    @crunched_puzzle
  end

  def elapsed_time
    end_time - start_time
  end

  def start_time
    @start_time
  end

  def end_time
    @end_time
  end
end
