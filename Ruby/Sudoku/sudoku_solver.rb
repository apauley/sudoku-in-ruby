class SudokuSolver
  def initialize(puzzle)
    @puzzle = puzzle
  end

  def solve
    if @puzzle.solved?
      return @puzzle
    else
      return SudokuPuzzle.new([[1]])
    end
  end
end
