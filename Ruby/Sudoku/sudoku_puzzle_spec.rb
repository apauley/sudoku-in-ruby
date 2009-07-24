require 'sudoku_puzzle'

describe SudokuPuzzle do
    it "should have a 9x9 grid by default" do
        puzzle = SudokuPuzzle.new(9)
        puzzle.grid.row_size().should == 9
        puzzle.grid.column_size().should == 9
    end

    it "should allow the construction of puzzles with sizes" do
        puzzle = SudokuPuzzle.new(2)
        puzzle.grid.row_size().should == 2
        puzzle.grid.column_size().should == 2
    end
end
