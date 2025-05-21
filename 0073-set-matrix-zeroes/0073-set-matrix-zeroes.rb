# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  n = matrix.length        # number of rows
  m = matrix[0].length     # number of columns

  zero_positions = Set.new # to store zero positions
  require 'set'            # Ruby Set needs to be required

  # First pass: find all zero positions
  (0...n).each do |i|
    (0...m).each do |j|
      if matrix[i][j] == 0
        zero_positions.add([i, j])
      end
    end
  end

  # Second pass: set rows and columns to zero
  zero_positions.each do |row, col|
    # Set entire row to 0
    (0...m).each do |j|
      matrix[row][j] = 0
    end

    # Set entire column to 0
    (0...n).each do |i|
      matrix[i][col] = 0
    end
  end

  matrix
end