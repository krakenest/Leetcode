class Solution(object):
    def countCompleteSubarrays(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        K = len(set(nums))

        def at_most(k):
            cnt = defaultdict(int)
            res = left = 0
            distinct = 0

            for right, x in enumerate(nums):
                if cnt[x] == 0:
                    distinct += 1
                cnt[x] += 1

                while distinct > k:
                    cnt[nums[left]] -= 1
                    if cnt[nums[left]] == 0:
                        distinct -= 1
                    left += 1

                res += right - left + 1

            return res
        return at_most(K) - at_most(K-1)