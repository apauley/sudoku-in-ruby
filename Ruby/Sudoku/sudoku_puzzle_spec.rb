require 'sudoku_puzzle'

def check_size(puzzle, expected_size)
  puzzle.grid.row_size().should == expected_size
  puzzle.grid.column_size().should == expected_size
end

describe SudokuPuzzle do
  it "should allow the grid contents to be supplied on creation" do
    puzzle = SudokuPuzzle.new([[1,2], [2,1]])
    check_size(puzzle, 2)
    puzzle = SudokuPuzzle.new([[1]])
    check_size(puzzle, 1)
  end

  it "should only allow square grids" do
    lambda {SudokuPuzzle.new([[1,2]])}.should raise_error()
  end

  it "should not allow cell values greater than the puzzle size" do
    lambda {SudokuPuzzle.new([[2]])}.should raise_error()
  end

  it "should know when another puzzle is equal to itself" do
    a_puzzle = SudokuPuzzle.new([[1]])
    same_puzzle = SudokuPuzzle.new([[1]])
    empty_puzzle = SudokuPuzzle.new([[0]])
    a_puzzle.should == same_puzzle
    a_puzzle.should_not == empty_puzzle
  end
end
