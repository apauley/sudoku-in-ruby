require 'sudoku_puzzle'

def check_size(puzzle, expected_size)
  puzzle.grid.row_size().should == expected_size
  puzzle.grid.column_size().should == expected_size
end

describe SudokuPuzzle do
  it "should have a 9x9 grid by default" do
    puzzle = SudokuPuzzle.new(9)
    check_size(puzzle, 9)
  end

  it "should allow the construction of puzzles with different sizes" do
    puzzle = SudokuPuzzle.new(2)
    check_size(puzzle, 2)
  end
end
