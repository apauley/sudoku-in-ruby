class SudokuSolver
  def initialize(puzzle)
    @algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    @try_your_luck = TryYourLuckAlgorithm.new(puzzle)
    freeze
  end

  def solve
    @algorithm.solve
    @try_your_luck.solve
  end
end
