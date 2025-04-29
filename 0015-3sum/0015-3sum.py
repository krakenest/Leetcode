class Solution(object):
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        nums.sort()  # Sort the array to make it easier to avoid duplicates
        result = []

        for i in range(len(nums) - 2):
            # Skip the same elements to avoid duplicates
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            
            # Use two pointers to find the remaining two numbers
            left, right = i + 1, len(nums) - 1
            
            while left < right:
                total = nums[i] + nums[left] + nums[right]
                
                if total < 0:
                    left += 1  # We need a larger sum, move left pointer right
                elif total > 0:
                    right -= 1  # We need a smaller sum, move right pointer left
                else:
                    # We found a valid triplet
                    result.append([nums[i], nums[left], nums[right]])
                    
                    # Skip duplicate values for left and right pointers
                    while left < right and nums[left] == nums[left + 1]:
                        left += 1
                    while left < right and nums[right] == nums[right - 1]:
                        right -= 1
                    
                    # Move pointers inward to continue searching
                    left += 1
                    right -= 1
        
        return result