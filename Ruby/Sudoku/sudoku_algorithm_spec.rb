require 'sudoku_puzzle'
require 'sudoku_algorithm'

describe RecursiveTrialAndErrorAlgorithm do
  it "should return its name as string representation" do
    puzzle = SudokuPuzzle.empty(1)
    algorithm = RecursiveTrialAndErrorAlgorithm.new(puzzle)
    algorithm.to_s.should == 'RecursiveTrialAndErrorAlgorithm'
  end

  it "should find the first incomplete component index" do
    rows = [[1,2,3,4],
            [3,4,1,2],
            [2,1,4,3],
            [4,3,2,0]]

    puzzle = SudokuPuzzle.new(rows)
    algorithm = RecursiveTrialAndErrorAlgorithm.new(puzzle)
    algorithm.incomplete_component_index(puzzle.rows).should == 3
  end

  it "should replace first 0 in a row with an element" do
    rows = [[1,2,3,4],
            [3,0,1,2],
            [2,1,4,3],
            [4,3,2,0]]

    puzzle = SudokuPuzzle.new(rows)
    algorithm = RecursiveTrialAndErrorAlgorithm.new(puzzle)
    newrow = algorithm.improve_component(puzzle.rows[1], 2)
    newrow.should == [3,2,1, 2]
    newrow = algorithm.improve_component(puzzle.rows[1], 3)
    newrow.should == [3, 3, 1, 2]
  end

  it "should return the row unchanged when it has nothing to do" do
    puzzle = SudokuPuzzle.new([[1]])
    algorithm = RecursiveTrialAndErrorAlgorithm.new(puzzle)
    newrow = algorithm.improve_component(puzzle.rows[0], 500)
    newrow.should == [1]
  end

  it "should try its luck with the rows" do
    rows = [[1,2,0,0],
            [3,0,0,2],
            [0,0,0,0],
            [4,3,2,0]]
    puzzle = SudokuPuzzle.new(rows)
    algorithm = RecursiveTrialAndErrorAlgorithm.new(puzzle)
    newpuzzle = algorithm.try_luck_with([1,2,3,4], puzzle.rows)
    rows = [[1,2,3,4],
            [3,4,1,2],
            [2,1,4,3],
            [4,3,2,1]]
    newpuzzle.should == SudokuPuzzle.new(rows)
  end
end
