# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    m = matrix.length
    n = matrix[0].length
    return false if target < matrix[0][0] || target > matrix[m - 1][n - 1]

    x0 = 0
    y0 = 0
    xm = m - 1
    yn = n - 1
    while x0 <= xm && y0 <= yn do
        # pp "x: #{x0} - #{xm}"
        # pp "y: #{y0} - #{yn}"
        # pp ""
        return true if [matrix[x0][y0], matrix[x0][yn], matrix[xm][y0], matrix[xm][yn]].include? target

        if matrix[x0][yn] > target
            yn -= 1
            next
        end
        if matrix[xm][y0] > target
            xm -= 1
            next
        end
        if matrix[xm][y0] < target
            x0 += 1
            next
        end
    end

    false
end

puts search_matrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5)
puts search_matrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 20)
