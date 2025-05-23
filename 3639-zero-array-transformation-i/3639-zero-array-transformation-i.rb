# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Boolean}
def is_zero_array(nums, queries)
    # represents how much the max decrement changes at each index i
    max_decrement_adjustment = Array.new(nums.length + 1, 0)

    # instead of looking at each query individually, we are going to track
    # how much the max decrement changes at each index
    queries.each do |query|
        # it increases at the left item of each query
        max_decrement_adjustment[query[0]] += 1

        # it decrease one after the right item of each query
        # (since the ranges are inclusive)
        max_decrement_adjustment[query[1] + 1] -= 1
    end

    curr_max_decrement = 0

    for i in 0...nums.length
        # The the current max decrement can be calculated by adding on the
        # adjustment each time. Negative adjustment will decrease it.
        curr_max_decrement += max_decrement_adjustment[i]

        # If we can't decrement enough to zero out the array at this point,
        # just return false.
        return false if nums[i] > curr_max_decrement
    end

    true
end