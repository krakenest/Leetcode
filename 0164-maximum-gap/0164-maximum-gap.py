class Solution(object):
    def maximumGap(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        if len(nums) < 2:
            return 0
        
        # Step 1: Find the minimum and maximum values
        min_num = min(nums)
        max_num = max(nums)
        
        # Step 2: Calculate the bucket size and the number of buckets
        n = len(nums)
        bucket_size = max(1, (max_num - min_num) // (n - 1))
        bucket_count = (max_num - min_num) // bucket_size + 1
        
        # Initialize the buckets
        buckets = [[float('inf'), float('-inf')] for _ in range(bucket_count)]
        
        # Step 3: Place each number into its respective bucket
        for num in nums:
            if num == min_num or num == max_num:
                continue
            index = (num - min_num) // bucket_size
            buckets[index][0] = min(buckets[index][0], num)
            buckets[index][1] = max(buckets[index][1], num)
        
        # Step 4: Calculate the maximum gap
        max_gap = 0
        prev_max = min_num
        
        for i in range(bucket_count):
            if buckets[i][0] == float('inf'):
                continue  # Empty bucket, skip it
            max_gap = max(max_gap, buckets[i][0] - prev_max)
            prev_max = buckets[i][1]
        
        max_gap = max(max_gap, max_num - prev_max)
        
        return max_gap
        