def maximum_difference(nums)
  min_num = Float::INFINITY
  max_diff = -1
  nums.each do |num|
    if num <= min_num
      min_num = num
    else
      max_diff = [max_diff, num - min_num].max
    end
  end
  max_diff
end