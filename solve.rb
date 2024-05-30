# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
    rows = []
    cols = []
    matrix.each_with_index do |row, i|
        row.each_with_index do |col, j|
            if row[j] == 0
                rows << i
                cols << j
            end
        end
    end
    rows.uniq!
    cols.uniq!

    rows.each do |r|
        matrix[r].each_with_index do |col, j|
            matrix[r][j] = 0
        end
    end
    cols.each do |c|
        matrix.each_with_index do |row, i|
            matrix[i][c] = 0
        end
    end
end
