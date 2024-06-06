# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
    resource = Hash.new(0)
    magazine.chars.each { |m| resource[m] += 1 }

    demand = Hash.new(0)
    ransom_note.chars.each { |n| demand[n] += 1 }
    return false if demand.each_pair.any? { |k, v| res = resource[k]; res.nil? || v > res }
    return true

     # longer?
    ransom_note.chars.each do |n|
        current = resource[n]
        return false if current.nil? || current == 0

        resource[n] = current - 1
    end
    true
end
