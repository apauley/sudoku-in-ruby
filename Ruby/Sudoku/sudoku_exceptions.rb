class SudokuError < RuntimeError
end

class NonSquareGridError < SudokuError
end

class TooLargeCellValueError < SudokuError
end

class DuplicateComponentValueError < SudokuError
end

class NoElementError < SudokuError
end
