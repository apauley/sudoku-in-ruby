require 'sudoku_puzzle'

describe SudokuPuzzle do
  it "should use grid rows for default construction" do
    puzzle = SudokuPuzzle.new([[1,0], [2,1]])
    puzzle.rows.should == [[1,0], [2,1]]
    puzzle.columns.should == [[1,2], [0,1]]

    puzzle = SudokuPuzzle.new([[1]])
    puzzle.rows.should == [[1]]
    puzzle.columns.should == [[1]]
  end

  it "should also allow construction with columns" do
    puzzle = SudokuPuzzle.columns([[2,1], [0,0]])
    puzzle.columns.should == [[2,1], [0,0]]
    puzzle.rows.should == [[2,0], [1,0]]
  end

  it "should allow the creation of an empty puzzle" do
    puzzle = SudokuPuzzle.empty(3)
    puzzle.rows.should == [[0,0,0], [0,0,0], [0,0,0]]
    puzzle.columns.should == [[0,0,0], [0,0,0], [0,0,0]]
  end

  it "should only allow square grids" do
    lambda {SudokuPuzzle.new([[1,2]])}.should raise_error()
  end

  it "should not allow cell values greater than the puzzle size" do
    lambda {SudokuPuzzle.new([[2]])}.should raise_error()
  end

  it "should not allow duplicate values in rows" do
    lambda {SudokuPuzzle.new([[1,1], [0,0]])}.should raise_error()
  end

  it "should not allow duplicate values in columns" do
    lambda {SudokuPuzzle.new([[2,0], [2,0]])}.should raise_error()
  end

  it "should know when another puzzle is equal to itself" do
    a_puzzle = SudokuPuzzle.new([[1]])
    same_puzzle = SudokuPuzzle.new([[1]])
    empty_puzzle = SudokuPuzzle.empty(1)
    a_puzzle.should == same_puzzle
    a_puzzle.should_not == empty_puzzle
  end

  it "should know whether it is solved" do
    empty_puzzle = SudokuPuzzle.empty(4)
    unsolved_puzzle = SudokuPuzzle.new([[1, 0], [0, 2]])
    solved_puzzle = SudokuPuzzle.new([[1,2,3], [2,3,1], [3,1,2]])
    empty_puzzle.solved?.should == false
    unsolved_puzzle.solved?.should == false
    solved_puzzle.solved?.should == true
  end

  it "should know its rows" do
    puzzle = SudokuPuzzle.new([[1,2], [2,1]])
    puzzle.rows.should == [[1,2], [2,1]]
  end

  it "should know its columns" do
    puzzle = SudokuPuzzle.new([[2,0], [1,0]])
    puzzle.columns.should == [[2,1], [0,0]]
  end

  it "should answer its cells" do
    puzzle = SudokuPuzzle.new([[2,0], [1,0]])
    puzzle.cell(1, 1).value.should == 2
    puzzle.cell(2, 2).value.should == 0
    puzzle.cell(2, 1).value.should == 1
  end

  it "should know its expected component total" do
    puzzle = SudokuPuzzle.empty(1)
    puzzle.component_total.should == 1

    puzzle = SudokuPuzzle.empty(2)
    puzzle.component_total.should == 3

    puzzle = SudokuPuzzle.empty(3)
    puzzle.component_total.should == 6
  end
end
