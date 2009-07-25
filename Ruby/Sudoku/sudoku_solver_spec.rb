require 'sudoku_solver'

describe SudokuSolver do
  it "should return a solved 1x1 puzzle unchanged" do
    puzzle = SudokuPuzzle.new([[1]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == puzzle
  end
end
