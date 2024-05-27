# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    if matrix.length == 1 && matrix[0].length == 1
        return matrix[0][0] == target
    end

    rows0 = matrix.map { |r| r[0] }
    target_row = -1
    (0..(rows0.length - 1)).each do |i|
        if rows0[i] <= target && ((i == rows0.length - 1) || target <= rows0[i + 1])
            target_row = i
        end
    end
    return false if target_row == -1

    matrix[target_row].include? target
end

puts search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)
puts search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
