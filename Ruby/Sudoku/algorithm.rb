class SudokuAlgorithm
  def SudokuAlgorithm.algorithms
    {"trial_and_error" => TrialAndErrorAlgorithm,
      "do_nothing" => DoNothingAlgorithm}
  end

  def SudokuAlgorithm.solve(puzzle)
    return new(puzzle).solve(puzzle)
  end

  def SudokuAlgorithm.solveRows(puzzleRows)
    puzzle = SudokuPuzzle.new(puzzleRows)
    return solve(puzzle)
  end

  def initialize(puzzle)
    @puzzle = puzzle
    freeze
  end

  def puzzle
    @puzzle
  end

  def solve
    raise NotImplementedError, 'Please implement this method in a subclass'
  end
end

class DoNothingAlgorithm < SudokuAlgorithm
  def solve(puzzle)
    return puzzle
  end
end
