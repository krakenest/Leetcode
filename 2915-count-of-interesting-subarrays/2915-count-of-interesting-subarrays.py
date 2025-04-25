class Solution(object):
    def countInterestingSubarrays(self, nums, modulo, k):
        """
        :type nums: List[int]
        :type modulo: int
        :type k: int
        :rtype: int
        """
        
        prefix_count = defaultdict(int)
        prefix_count[0] = 1
        count = 0
        prefix = 0

        for num in nums:
            if num % modulo == k:
                prefix += 1
                
            mod_key = (prefix - k) % modulo
            count += prefix_count[mod_key]

            prefix_count[prefix % modulo] += 1

        return count