require 'sudoku_puzzle'
require 'sudoku_algorithm'

describe TryYourLuckAlgorithm do
  it "should find the first incomplete component index" do
    puzzle = SudokuPuzzle.new([[1,2], [2,0]])
    algorithm = TryYourLuckAlgorithm.new(puzzle)
    algorithm.incomplete_component_index(puzzle.rows).should == 1
  end

  it "should replace first 0 in a row with an element" do
    puzzle = SudokuPuzzle.new([[1,0], [0,0]])
    algorithm = TryYourLuckAlgorithm.new(puzzle)
    newrow = algorithm.improve_component(puzzle.rows[0], 2)
    newrow.should == [1, 2]
    newrow = algorithm.improve_component(puzzle.rows[0], 3)
    newrow.should == [1, 3]
  end

  it "should return the row unchanged when it has nothing to do" do
    puzzle = SudokuPuzzle.new([[1]])
    algorithm = TryYourLuckAlgorithm.new(puzzle)
    newrow = algorithm.improve_component(puzzle.rows[0], 500)
    newrow.should == [1]
  end

  it "should try its luck with the rows" do
    puzzle = SudokuPuzzle.new([[1,0], [0,0]])
    algorithm = TryYourLuckAlgorithm.new(puzzle)
    newpuzzle = algorithm.try_luck_with([1,2], puzzle.rows)
    newpuzzle.should == SudokuPuzzle.new([[1,2], [2,1]])
  end
end

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

  it "should not change rows with too little info when trying to improve a grid component" do
    rows = [[0,3,0], [1,0,0], [0,0,0]]
    puzzle = SudokuPuzzle.new(rows)
    algorithm = CompleteLastRemainingAlgorithm.new(puzzle)
    algorithm.fill_components(rows).should == rows
  end

  it "should do what it can on a puzzle with too little info and quit" do
    impossible_puzzle = SudokuPuzzle.new([[1,0,3], [0,0,0], [0,0,0]])
    algorithm = CompleteLastRemainingAlgorithm.new(impossible_puzzle)
    algorithm.solve.should == SudokuPuzzle.new([[1,2,3], [0,0,0], [0,0,0]])
  end
end
