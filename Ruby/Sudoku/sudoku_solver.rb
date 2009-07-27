class SudokuSolver
  def initialize(puzzle)
    @puzzle = puzzle
    @algoritm = CompleteLastRemainingAlgorithm.new(puzzle)
    freeze
  end

  def solve
    @algoritm.solve
  end
end
