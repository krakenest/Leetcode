def remove_element(nums, val)
  k = 0

  # Iterate through the array and shift the elements that are not equal to val
  nums.each_with_index do |num, index|
    if num != val
      nums[k] = num
      k += 1
    end
  end
  
  # Return the number of elements that are not equal to val
  return k
end
