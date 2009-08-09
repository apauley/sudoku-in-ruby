require 'sudoku_solver'

describe SudokuSolver do
  it "should return time stats" do
    puzzle = SudokuPuzzle.empty(1)
    solver = SudokuSolver.new(puzzle)
    solver.start_time.should < Time.now
    solver.end_time.should > solver.start_time
    solver.elapsed_time.should == solver.end_time - solver.start_time
  end

  it "should return a solved puzzle unchanged" do
    puzzle = SudokuPuzzle.new([[1]])
    solver = SudokuSolver.new(puzzle)
    solver.crunched_puzzle.object_id.should == puzzle.object_id
  end

  it "should solve a 1x1 puzzle" do
    puzzle = SudokuPuzzle.new([[0]])
    solver = SudokuSolver.new(puzzle)
    solver.crunched_puzzle.should == SudokuPuzzle.new([[1]])
  end

  it "should solve a 4x4 puzzle" do
    puzzle = SudokuPuzzle.empty(4)
    solver = SudokuSolver.new(puzzle)
    solved_puzzle = solver.crunched_puzzle
    rows = [[1,2,3,4],
            [3,4,1,2],
            [2,1,4,3],
            [4,3,2,1]]

    solved_puzzle.solved?.should == true
    solved_puzzle.rows.should == rows
  end

end
