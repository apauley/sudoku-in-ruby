require 'sudoku_algorithm'

class SudokuSolver
  def SudokuSolver.algorithms
    {"trial_and_error" => RecursiveTrialAndErrorAlgorithm}
  end

  def initialize(puzzle, algorithm_to_use="trial_and_error")
    @valid_attempts = 0
    @error_attempts = 0

    @start_time = Time.now
    @algorithm = self.class.algorithms[algorithm_to_use].new(puzzle, solver=self)
    @crunched_puzzle = @algorithm.solve.puzzle
    @end_time = Time.now
    freeze
  end

  def valid_attempt!
    @valid_attempts = @valid_attempts + 1
  end

  def error_attempt!
    @error_attempts = @error_attempts + 1
  end

  def valid_attempts
    @valid_attempts
  end

  def error_attempts
    @error_attempts
  end

  def total_attempts
    @valid_attempts + @error_attempts
  end

  def to_s
    "Start time:\t#{start_time}\n" +
    "End time:\t#{end_time}\n" +
    "Elapsed time:\t#{elapsed_time}\n" +
    "Algorithm:\t#{@algorithm}\n" +
    "Valid attempts:\t#{valid_attempts}\n" +
    "Error attempts:\t#{error_attempts}\n" +
    "Total attempts:\t#{total_attempts}\n" +
    "\nCrunched #{crunched_puzzle}\n"
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
