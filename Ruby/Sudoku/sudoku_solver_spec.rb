require 'sudoku_solver'

describe SudokuSolver do
  it "should return a solved 1x1 puzzle unchanged" do
    puzzle = SudokuPuzzle.new([[1]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.object_id.should == puzzle.object_id
  end

  it "should solve a 1x1 puzzle" do
    puzzle = SudokuPuzzle.new([[0]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == SudokuPuzzle.new([[1]])
  end
end
