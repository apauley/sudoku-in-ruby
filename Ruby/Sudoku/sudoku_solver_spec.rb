require 'sudoku_solver'

describe SudokuSolver do
  it "should return time stats" do
    puzzle = SudokuPuzzle.empty(1)
    solver = SudokuSolver.new(puzzle)
    solver.start_time.should < Time.now
    solver.end_time.should > solver.start_time
    solver.elapsed_time.should == solver.end_time - solver.start_time
  end

  it "should have a computed puzzle" do
    puzzle = SudokuPuzzle.empty(1)
    solver = SudokuSolver.new(puzzle)
    solver.crunched_puzzle.should == SudokuPuzzle.new([[1]])
  end

  it "should count attempts and errors" do
    rows = [[1,2,3,0],
            [3,4,1,2],
            [2,1,4,3],
            [4,3,2,1]]

    puzzle = SudokuPuzzle.new(rows)
    solver = SudokuSolver.new(puzzle)
    solver.valid_attempts.should == 1
    solver.error_attempts.should == 3
  end

  it "should have an informative string representation" do
    puzzle = SudokuPuzzle.empty(1)
    solver = SudokuSolver.new(puzzle)
    solver.to_s.include?("Start time:\t#{solver.start_time}").should == true
    solver.to_s.include?("End time:\t#{solver.end_time}").should == true
    solver.to_s.include?("Elapsed time:\t#{solver.elapsed_time}").should == true
    solver.to_s.include?("Algorithm:").should == true
    solver.to_s.include?("Valid attempts:\t#{solver.valid_attempts}").should == true
    solver.to_s.include?("Error attempts:\t#{solver.error_attempts}").should == true
    solver.to_s.include?("Total attempts:\t#{solver.total_attempts}").should == true
    solver.to_s.include?("Crunched #{solver.crunched_puzzle}").should == true
  end
end
