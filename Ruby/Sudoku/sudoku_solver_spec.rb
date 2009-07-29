require 'sudoku_solver'

describe SudokuSolver do
  it "should return a solved puzzle unchanged" do
    puzzle = SudokuPuzzle.new([[1]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.object_id.should == puzzle.object_id
  end

  it "should solve a 1x1 puzzle" do
    puzzle = SudokuPuzzle.new([[0]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == SudokuPuzzle.new([[1]])
  end

  it "should solve a 2x2 puzzle" do
    puzzle = SudokuPuzzle.new([[1,0], [0,0]])
    solver = SudokuSolver.new(puzzle)
#    solver.solve.should == SudokuPuzzle.new([[1,2], [2,1]])

    puzzle = SudokuPuzzle.new([[0,0], [0,2]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == SudokuPuzzle.new([[2,1], [1,2]])
  end

  it "should solve a 3x3 puzzle" do
    puzzle = SudokuPuzzle.new([[2,1,0], [1,0,0], [0,0,0]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == SudokuPuzzle.new([[2,1,3], [1,3,2], [3,2,1]])
  end
end
