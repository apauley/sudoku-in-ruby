require 'sudoku_puzzle'

describe SudokuPuzzle do
  it "should represent itself as a nice string" do
    puzzle = SudokuPuzzle.new([[1,0], [2,1]])
    puzzle.to_s.should == "2x2 puzzle:\n10\n21\n\n"
  end

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
    lambda {SudokuPuzzle.new([[1,2]])}.should raise_error(NonSquareGridError)
  end

  it "should not allow cell values greater than the puzzle size" do
    lambda {SudokuPuzzle.new([[2]])}.should raise_error(TooLargeCellValueError)
  end

  it "should not allow duplicate values in rows" do
    lambda {SudokuPuzzle.new([[1,1], [0,0]])}.should raise_error(DuplicateComponentValueError)
  end

  it "should not allow duplicate values in columns" do
    lambda {SudokuPuzzle.new([[2,0], [2,0]])}.should raise_error()
  end

  it "should not allow duplicate values in blocks" do
    lambda {SudokuPuzzle.new([[1,2,3,4], [2,0,0,0], [3,0,0,0], [4,0,0,0]])}.should raise_error()
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

  it "should know if it is a square puzzle" do
    SudokuPuzzle.empty(1).square?.should == true
    SudokuPuzzle.empty(2).square?.should == false
    SudokuPuzzle.empty(4).square?.should == true
    SudokuPuzzle.empty(9).square?.should == true
  end

  it "should know its block size" do
    SudokuPuzzle.empty(1).block_size.should == 1
    SudokuPuzzle.empty(4).block_size.should == 2
    SudokuPuzzle.empty(9).block_size.should == 3
  end

  it "should have block size of 1 for non-square puzzles" do
    SudokuPuzzle.empty(2).block_size.should == 1
    SudokuPuzzle.empty(3).block_size.should == 1
    SudokuPuzzle.empty(5).block_size.should == 1
  end

  it "should know its blocks" do
    puzzle = SudokuPuzzle.new([[4,2,3,1], [1,3,4,2], [3,1,2,4], [2,4,1,3]])
    puzzle.blocks.size.should == puzzle.size
    puzzle.blocks[0].should == [[4,2],[1,3]]
    puzzle.blocks[1].should == [[3,1],[4,2]]
    puzzle.blocks[2].should == [[3,1],[2,4]]
    puzzle.blocks[3].should == [[2,4],[1,3]]
  end

  it "should return blocks for 9x9 puzzles correctly" do
    rows = [[0,4,7, 0,0,0, 0,0,0],
            [0,0,5, 0,0,0, 0,0,0],
            [8,0,0, 0,0,9, 0,1,0],

            [0,0,0, 0,0,0, 6,2,3],
            [5,0,0, 0,0,0, 0,7,0],
            [0,2,0, 0,8,4, 9,0,0],

            [2,0,0, 0,9,0, 0,0,0],
            [0,0,0, 3,2,0, 0,0,9],
            [0,8,0, 7,0,0, 4,0,0],
           ]
    puzzle = SudokuPuzzle.new(rows)

    puzzle.blocks[0].should == [[0,4,7], [0,0,5], [8,0,0]]
    puzzle.blocks[1].should == [[0,0,0], [0,0,0], [0,0,9]]
    puzzle.blocks[2].should == [[0,0,0], [0,0,0], [0,1,0]]

    puzzle.blocks[3].should == [[0,0,0], [5,0,0], [0,2,0]]
    puzzle.blocks[4].should == [[0,0,0], [0,0,0], [0,8,4]]
    puzzle.blocks[5].should == [[6,2,3], [0,7,0], [9,0,0]]

    puzzle.blocks[6].should == [[2,0,0], [0,0,0], [0,8,0]]
    puzzle.blocks[7].should == [[0,9,0], [3,2,0], [7,0,0]]
    puzzle.blocks[8].should == [[0,0,0], [0,0,9], [4,0,0]]
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
