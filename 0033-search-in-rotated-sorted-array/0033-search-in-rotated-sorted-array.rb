def search(nums, target)
    left = 0
    right = nums.length - 1
    while left <= right
        pivot = (left+right+1) / 2
        return pivot if nums[pivot] == target

        if nums[pivot] >= nums[left] # left is sorted
            if target >= nums[left] && target <= nums[pivot]
                right = pivot-1
            else
                left = pivot+1
            end
        else # right is sorted
            if target <= nums[right] && target >= nums[pivot]
                left = pivot+1
            else
                right = pivot-1
            end
        end
    end

    return -1 
end