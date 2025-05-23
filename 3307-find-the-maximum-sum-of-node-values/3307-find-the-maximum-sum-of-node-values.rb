# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer[][]} edges
# @return {Integer}
def maximum_value_sum(nums, k, edges)
  perfect_sum = 0
  count = 0
  min_abs_diff = Float::INFINITY

  nums.each do |original_val|
    xor_val = original_val ^ k

    if xor_val > original_val
      perfect_sum += xor_val
      count += 1
    else
      perfect_sum += original_val
    end

    abs_diff = (original_val - xor_val).abs
    min_abs_diff = [abs_diff, min_abs_diff].min
  end

  if count.even?
    perfect_sum
  else
    perfect_sum - min_abs_diff
  end
end