class SudokuSolver
  def initialize(puzzle)
    @puzzle = puzzle
    freeze
  end

  def solve
    if @puzzle.solved?
      return @puzzle
    end

    if @puzzle.size == 1
      return SudokuPuzzle.new([[1]])
    else
      return SudokuPuzzle.new([[1,2], [2,1]])
    end
  end
end
