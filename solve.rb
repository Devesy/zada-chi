# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
    m = Array.new(n, 0)
    m.each_with_index do |row, i|
        m[i] = Array.new(n, 0)
    end

    x = 0
    y = 0
    is_row = true
    is_straight = true

    1.upto(n * n) do |curr|
        # pp "-> #{[x, y]}, #{curr}, #{is_row}, #{is_straight}"
        if m[x][y] == 0
            m[x][y] = curr
        end

        if is_row
            if is_straight
                if m[x][y + 1] == 0
                    y += 1
                    next
                else
                    is_row = false
                    x += 1
                    next
                end
            else
                if m[x][y - 1] == 0
                    y -= 1
                    next
                else
                    is_row = false
                    is_straight = false
                    x -= 1
                end
            end
        else # column
            if is_straight
                if !m[x + 1].nil? && m[x + 1][y] == 0
                    x += 1
                    next
                else
                    is_row = true
                    is_straight = false
                    y -= 1
                end
            else
                if !m[x - 1].nil? && m[x - 1][y] == 0
                    x -= 1
                    next
                else
                    is_row = true
                    is_straight = true
                    y += 1
                end
            end
        end
    end
    m
end
