# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    return 0 if nums.empty?

    k = 1

    (1...nums.length).each do |i|
        if nums[i] != nums[k - 1]
            nums[k] = nums[i]
            k += 1
        end
    end

    k
end