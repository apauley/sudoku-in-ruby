require 'sudoku_algorithm'
require 'sudoku_puzzle'
require 'stats_keeper'

class SudokuSolver
  def SudokuSolver.algorithms
    {"trial_and_error" => TrialAndErrorAlgorithm}
  end

  def SudokuSolver.newWithEmptyPuzzle(size, algorithm_to_use="trial_and_error")
    puzzle = SudokuPuzzle.empty(size)
    return self.new(puzzle.rows)
  end

  def initialize(puzzleRows, algorithm_to_use="trial_and_error")
    @stats_keeper = SolverStatsKeeper.new
    @input_puzzle = SudokuPuzzle.new(puzzleRows, stats_keeper=@stats_keeper)
    @algorithm = self.class.algorithms[algorithm_to_use]
    @crunched_puzzle = @algorithm.solve(@input_puzzle)
    @stats_keeper.end_time!
    freeze
  end

  def to_s
    "Start time:\t#{@stats_keeper.start_time}\n" +
    "End time:\t#{@stats_keeper.end_time}\n" +
    "Elapsed time:\t#{@stats_keeper.elapsed_time}\n" +
    "Algorithm:\t#{@algorithm}\n" +
    "Valid attempts:\t#{@stats_keeper.valid_attempts}\n" +
    "Error attempts:\t#{@stats_keeper.error_attempts}\n" +
    "Total attempts:\t#{@stats_keeper.total_attempts}\n" +
    "\nInput #{input_puzzle}\n" +
    "\nCrunched #{crunched_puzzle}\n"
  end

  def algorithm
    @algorithm
  end

  def stats_keeper
    @stats_keeper
  end

  def input_puzzle
    @input_puzzle
  end

  def crunched_puzzle
    @crunched_puzzle
  end
end
