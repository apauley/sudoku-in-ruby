class SudokuSolver
  def initialize(puzzle)
    @algoritm = CompleteLastRemainingAlgorithm.new(puzzle)
    freeze
  end

  def solve
    @algoritm.solve
  end
end
