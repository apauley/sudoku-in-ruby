class SudokuCell
  def initialize(cell_value)
    @value = cell_value
    freeze
  end

  def value
    @value
  end
end
