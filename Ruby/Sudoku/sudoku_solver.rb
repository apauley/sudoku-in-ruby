class SudokuSolver
  def initialize(puzzle)
    @puzzle = puzzle
    @algoritm = SudokuAlgorithm.new(puzzle)
    freeze
  end

  def solve
    @algoritm.solve
  end
end
