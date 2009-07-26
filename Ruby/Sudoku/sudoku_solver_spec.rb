require 'sudoku_solver'

describe SudokuSolver do
  it "should return a solved puzzle unchanged" do
    puzzle = SudokuPuzzle.new([[1]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.object_id.should == puzzle.object_id
  end

  it "should complete the last remaining element of a grid component" do
    puzzle = SudokuPuzzle.new([[0]])
    solver = SudokuSolver.new(puzzle)
    solver.improve_grid_component(puzzle.rows[0]).should == [1]

    puzzle = SudokuPuzzle.new([[1,0], [0,0]])
    solver = SudokuSolver.new(puzzle)
    solver.improve_grid_component(puzzle.rows[0]).should == [1,2]

    puzzle = SudokuPuzzle.new([[1,2,0], [2,0,0], [0,0,0]])
    solver = SudokuSolver.new(puzzle)
    solver.improve_grid_component(puzzle.rows[0]).should == [1,2,3]
  end

  it "should return an empty row unchanged when trying to improve a grid component" do
    puzzle = SudokuPuzzle.new([[0,0], [0,0]])
    solver = SudokuSolver.new(puzzle)
    solver.improve_grid_component(puzzle.rows[0]).should == [0,0]
  end

  it "should solve a 1x1 puzzle" do
    puzzle = SudokuPuzzle.new([[0]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == SudokuPuzzle.new([[1]])
  end

  it "should solve a 2x2 puzzle" do
    puzzle = SudokuPuzzle.new([[1,0], [0,0]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == SudokuPuzzle.new([[1,2], [2,1]])

    puzzle = SudokuPuzzle.new([[0,0], [0,2]])
    solver = SudokuSolver.new(puzzle)
    solver.solve.should == SudokuPuzzle.new([[2,1], [1,2]])
  end
end
