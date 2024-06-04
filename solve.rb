# frozen_string_literal: true

LETTERS = {
    '2': ['a', 'b', 'c'],
    '3': ['d', 'e', 'f'],
    '4': ['g', 'h', 'i'],
    '5': ['j', 'k', 'l'],
    '6': ['m', 'n', 'o'],
    '7': ['p', 'q', 'r', 's'],
    '8': ['t', 'u', 'v'],
    '9': ['w', 'x', 'y', 'z'],
}.freeze

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    return [] if digits.length == 0
    return LETTERS[digits.chars[0].to_sym] if digits.length == 1

    result = []
    digits.chars.each_with_index do |digit, i|
        LETTERS[digit.to_sym].each do |l1|
            letter_combinations(digits[(1 + i)..-1]).each do |l2|
                result << l1 + l2
            end
        end
    end
    # pp result
    result.filter { |r| r.length == digits.length }
end
