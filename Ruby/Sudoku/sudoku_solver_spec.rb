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

  it "should solve a 4x4 puzzle" do
    puzzle = SudokuPuzzle.empty(4)
    solver = SudokuSolver.new(puzzle)
    solved_puzzle = solver.solve
    rows = [[1,2,3,4],
            [3,4,1,2],
            [2,1,4,3],
            [4,3,2,1]]

    solved_puzzle.solved?.should == true
    solved_puzzle.rows.should == rows
  end

end
