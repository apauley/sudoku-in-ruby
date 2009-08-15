class SudokuAlgorithm
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
