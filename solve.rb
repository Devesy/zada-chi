# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
    return s if num_rows == 1

    m = Array.new(num_rows, '')
    m.each_with_index { |r, i| m[i] = Array.new(s.length, '') }

    x = 0
    y = 0
    chars = s.each_char.to_a.each_slice((2 * num_rows - 2) > 0 ? (2 * num_rows - 2) : 1 ).with_index do |slice, j|
        slice.each_with_index do |c, i|
            # pp "#{x}, #{y}, #{c}"
            m[x][y] = c
            if i < num_rows - 1
                x += 1
            else
                x -= 1
                y += 1
            end
        end
        y += ((j + 1) * num_rows - 1)
    end
    # pp m.map(&:join).join
    m.map(&:join).join
end
