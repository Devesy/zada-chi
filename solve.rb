# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    store = {}
    nums.each_with_index do |n, i|
        return [i, store[target - n]] if store[target - n] != nil

        store[n] = i
    end
end
