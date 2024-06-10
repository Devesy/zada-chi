# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
    return [] if intervals.length == 0
    return intervals if intervals.length == 1

    intervals.sort! { |a, b| a[0] >= b[0] ? 1 : -1 }

    output = []
    current = intervals[0]
    intervals.each do |i|
        if (i[0] <= current[1] && i[0] >= current[0])
            current[1] = [current[1], i[1]].max
            current[0] = [current[0], i[0]].min
            next
        end
        output << current
        current = [i[0], i[1]]
    end
    output << current
    output
end
