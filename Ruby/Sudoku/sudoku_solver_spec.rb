require 'sudoku_solver'

describe SudokuSolver do
  it "should return time stats" do
    puzzle = SudokuPuzzle.empty(1)
    solver = SudokuSolver.new(puzzle)
    solver.start_time.should < Time.now
    solver.end_time.should > solver.start_time
    solver.elapsed_time.should == solver.end_time - solver.start_time
  end

  it "should have an informative string representation" do
    puzzle = SudokuPuzzle.empty(1)
    solver = SudokuSolver.new(puzzle)
    solver.to_s.include?("Start time:\t#{solver.start_time}").should == true
    solver.to_s.include?("End time:\t#{solver.end_time}").should == true
    solver.to_s.include?("Elapsed time:\t#{solver.elapsed_time}").should == true
    solver.to_s.include?("Algorithm:").should == true
    solver.to_s.include?("Crunched #{solver.crunched_puzzle}").should == true
  end
end
