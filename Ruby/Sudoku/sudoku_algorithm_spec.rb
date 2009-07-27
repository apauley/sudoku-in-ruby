require 'sudoku_algorithm'

describe CompleteLastRemainingAlgorithm do
  it "should complete the last remaining element of a grid component" do
    puzzle = SudokuPuzzle.empty(1)
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.fill_remaining_element(puzzle.rows[0]).should == [1]

    puzzle = SudokuPuzzle.new([[1,0], [0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.fill_remaining_element(puzzle.rows[0]).should == [1,2]

    puzzle = SudokuPuzzle.new([[1,2,0], [2,0,0], [0,0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.fill_remaining_element(puzzle.rows[0]).should == [1,2,3]
  end

  it "should not change a row with too little info when trying to improve a grid component" do
    rows = [[0,3,0], [1,0,0], [0,0,0]]
    puzzle = SudokuPuzzle.new(rows)
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.improve_components(rows).should == rows
  end

  it "should do what it can on a puzzle with too little info and quit" do
    impossible_puzzle = SudokuPuzzle.new([[1,0,3], [0,0,0], [0,0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(impossible_puzzle)
    algorithm.solve.should == SudokuPuzzle.new([[1,2,3], [0,0,0], [0,0,0]])
  end
end
