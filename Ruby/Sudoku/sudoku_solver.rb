class SudokuSolver
  def initialize(puzzle)
    @puzzle = puzzle
    puts puzzle.grid.to_s
    freeze
  end

  def solve
    if @puzzle.solved?
      return @puzzle
    end

    if @puzzle.size == 1
      return SudokuPuzzle.new([[1]])
    end

    @puzzle.rows.each {|row|
      puts '|sum '+@puzzle.sum(row).to_s+' sum|'
    }
  end
end
