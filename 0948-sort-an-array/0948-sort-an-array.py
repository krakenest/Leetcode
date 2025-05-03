class Solution(object):
    def sortArray(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        if len(nums) <= 1:
            return nums
        
        # Helper function to merge two sorted halves
        def merge(left, right):
            sorted_array = []
            while left and right:
                if left[0] < right[0]:
                    sorted_array.append(left.pop(0))
                else:
                    sorted_array.append(right.pop(0))
            
            # Add any remaining elements
            sorted_array.extend(left)
            sorted_array.extend(right)
            
            return sorted_array
        
        # Split the array into two halves
        mid = len(nums) // 2
        left_half = self.sortArray(nums[:mid])
        right_half = self.sortArray(nums[mid:])
        
        # Merge the sorted halves
        return merge(left_half, right_half)