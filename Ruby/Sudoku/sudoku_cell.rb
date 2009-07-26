class SudokuCell
  def initialize(cell_value=0)
    @value = cell_value
    freeze
  end

  def value
    @value
  end
end
