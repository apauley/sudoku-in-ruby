require 'sudoku_solver'

describe SudokuSolver do
  it "should return a start time" do
    solver = SudokuSolver.new()
    puzzle = SudokuPuzzle.empty(1)
    results = solver.solve(puzzle)
    results['start_time'].should < Time.now
  end

  it "should return a solved puzzle unchanged" do
    solver = SudokuSolver.new()
    puzzle = SudokuPuzzle.new([[1]])
    results = solver.solve(puzzle)
    results['puzzle'].object_id.should == puzzle.object_id
  end

  it "should solve a 1x1 puzzle" do
    solver = SudokuSolver.new()
    puzzle = SudokuPuzzle.new([[0]])
    results = solver.solve(puzzle)
    results['puzzle'].should == SudokuPuzzle.new([[1]])
  end

  it "should solve a 4x4 puzzle" do
    solver = SudokuSolver.new()
    puzzle = SudokuPuzzle.empty(4)
    results = solver.solve(puzzle)
    solved_puzzle = results['puzzle']
    rows = [[1,2,3,4],
            [3,4,1,2],
            [2,1,4,3],
            [4,3,2,1]]

    solved_puzzle.solved?.should == true
    solved_puzzle.rows.should == rows
  end

end
