require 'sudoku_algorithm'

describe CompleteLastRemainingAlgorithm do
  it "should complete the last remaining element of a grid component" do
    puzzle = SudokuPuzzle.empty(1)
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.improve_grid_component(puzzle.rows[0]).should == [1]

    puzzle = SudokuPuzzle.new([[1,0], [0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.improve_grid_component(puzzle.rows[0]).should == [1,2]

    puzzle = SudokuPuzzle.new([[1,2,0], [2,0,0], [0,0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.improve_grid_component(puzzle.rows[0]).should == [1,2,3]
  end

  it "should not change a row with too little info when trying to improve a grid component" do
    puzzle = SudokuPuzzle.new([[0,3,0], [1,0,0], [0,0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.improve_grid_component(puzzle.rows[0]).should == [0,3,0]
    algorithm.improve_grid_component(puzzle.rows[1]).should == [1,0,0]
    algorithm.improve_grid_component(puzzle.rows[2]).should == [0,0,0]
  end

  it "should do what it can on an impossible puzzle and quit" do
    impossible_puzzle = SudokuPuzzle.new([[1,0,3], [0,0,0], [0,0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(impossible_puzzle)
    algorithm.solve.should == SudokuPuzzle.new([[1,2,3], [0,0,0], [0,0,0]])
  end
end
