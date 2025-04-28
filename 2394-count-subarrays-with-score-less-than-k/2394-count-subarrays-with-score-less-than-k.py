class Solution(object):
    def countSubarrays(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """

        n = len(nums)
        left = 0
        total = 0
        ans = 0

        for right in range(n):
            total += nums[right]
            while total * (right - left + 1) >= k:
                total -= nums[left]
                left += 1
            ans += right - left + 1

        return ans
        