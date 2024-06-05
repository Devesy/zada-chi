# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    return nums if nums.length <= k

    freqs = Hash.new(0)
    nums.each { |n| freqs[n] += 1 }
    freqs.to_a.sort { |a, b| a[1] < b[1] ? 1 : -1 }.map { |a| a[0] }.take(k)
end
