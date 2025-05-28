# Solution:
#   1) brute force, go through all 9x9 and identify cells where numbers can be deterministically filled, fill them out
#   2) if no deterministic fill possible, attempt to fill with any of the remaining options and Repeat recursively until solved

class Solver
    attr_accessor :board
    def initialize(board)
        @board = board

        # Track which boxes have which numbers
        @box_index = []

        # Track which rows have which numbers
        @row_index = []

        # Track which columns have which numbers
        @col_index = []

        # Track cells filled to reset the board after subsequent attempts
        @cells_filled = []

        @all_numbers = (1..9).to_a.map(&:to_s)

        init_min_options
        init_indices
        init_filled_count
    end

    # Recursive function, attempts deterministic solve
    #   * as long as numbers can be deterministically filled in, keeps filling the board
    #   * when numbers are not deterministic, get list of options and try them recursively
    def solve
        return true if @filled_count >= 81
        return true if deterministic_solve!
        return false if @min_remaining_coordinates.length == 0

        options = remaining_options(@min_remaining_coordinates[0], @min_remaining_coordinates[1])
        target_row, target_col = @min_remaining_coordinates
        
        return false unless @min_remaining_coordinates[0] > 0

        options.each do |option|
            init_min_options
            fill!(target_row, target_col, option)
            last_attempt_index = @cells_filled.length - 1

            if solve || @filled_count >= 81
                return true
            else
                (last_attempt_index...@cells_filled.length).reverse_each do |attempt_index|
                    clear!(@cells_filled[attempt_index][0], @cells_filled[attempt_index][1])
                    @cells_filled.pop
                end
            end
        end
        false
    end

    private

    # Attempts to fill numbers based on excluding numbers in the same box,row or column
    # Returns true if at least 1 cell was filled, false otherwise
    def deterministic_solve!
        # Track whether we could fill in at least 1 single number, otherwise we need to brute force various attempts
        filled = false
        loop do
            filled = false
            @board.each_with_index do |row, row_number|
                row.each_with_index do |col, col_number|
                    # Skip if cell already has number
                    next if @board[row_number][col_number] != "."
                    remaining = remaining_options(row_number, col_number)

                    # Board is invalid if no numbers can be used, and cell isn't filled
                    if remaining.length == 0
                        return false
                    elsif remaining.length == 1
                        filled = true
                        fill!(row_number, col_number, remaining[0].to_s)
                    else
                        check_min_remaining_options(remaining, row_number, col_number)
                    end
                end
            end

            # When we don't need to guess, just fill as much as possible
            break if !filled || @filled_count >= 81
        end
        return filled
    end

    def fill!(row_number, col_number, n)
        @board[row_number][col_number] = n
        @filled_count += 1
        @row_index[row_number][n] = true
        @col_index[col_number][n] = true
        @box_index[@box_indices[row_number][col_number]][n] = true
        @cells_filled.push([row_number, col_number])
    end

    def clear!(row_number, col_number)
        n = @board[row_number][col_number]
        @board[row_number][col_number] = "."
        @filled_count -= 1
        @row_index[row_number].delete(n)
        @col_index[col_number].delete(n)
        @box_index[@box_indices[row_number][col_number]].delete(n)
    end

    def init_min_options
        # row,col coordinates of whichever cell has the last amount of remaining options, greater than 1, updated on each solve iteration
        @min_remaining_coordinates = []
        @min_remaining_count = 10
    end

    def init_indices
        9.times do |i|
            @box_index[i] = Hash.new
            @col_index[i] = Hash.new
            @row_index[i] = Hash.new
        end

        @box_indices = [
            [0, 0, 0, 1, 1, 1, 2, 2, 2],
            [0, 0, 0, 1, 1, 1, 2, 2, 2],
            [0, 0, 0, 1, 1, 1, 2, 2, 2],
            [3, 3, 3, 4, 4, 4, 5, 5, 5],
            [3, 3, 3, 4, 4, 4, 5, 5, 5],
            [3, 3, 3, 4, 4, 4, 5, 5, 5],
            [6, 6, 6, 7, 7, 7, 8, 8, 8],
            [6, 6, 6, 7, 7, 7, 8, 8, 8],
            [6, 6, 6, 7, 7, 7, 8, 8, 8]
        ]

        @board.each_with_index do |row, row_number|
            row.each_with_index do |n, col_number|
                next if n == "."
                box_number = @box_indices[row_number][col_number]
                @box_index[box_number] ||= Hash.new
                @row_index[row_number][n] = true
                @col_index[col_number][n] = true
                @box_index[box_number][n] = true
            end
        end
    end

    def init_filled_count
        @filled_count = @board.map do |row|
            row.map do |cell|
                (cell != ".") ? 1 : 0
            end.inject(&:+)
        end.inject(&:+)
    end

    # @return {[] | nil} Returns an array of remaining options for a given cell, or nil if that cell can't get a number or already has one
    def remaining_options(row_number, col_number)
        return [] if @board[row_number][col_number] != "."
        @all_numbers - @box_index[@box_indices[row_number][col_number]].keys - @row_index[row_number].keys - @col_index[col_number].keys
    end

    # Tracks minimum remaining options for cells that can't be immediately filled
    def check_min_remaining_options(remaining, row, col)
        if !remaining.nil? && remaining.length > 1 && @min_remaining_count >= remaining.length
            @min_remaining_count = remaining.length
            @min_remaining_coordinates = [row,col]
        end
    end
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
    Solver.new(board).solve
end