class Solution(object):
    def countLargestGroup(self, n):
        """
        :type n: int
        :rtype: int
        """
        counts = {}

        for i in range (1, n + 1):
            s = sum(int(d) for d in str(i)) 
            counts[s] = counts.get(s, 0) + 1

        max_size = max(counts.values())
        return sum (1 for size in counts.values() if size == max_size)