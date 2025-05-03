class Solution(object):
    def smallestTrimmedNumbers(self, nums, queries):
        """
        :type nums: List[str]
        :type queries: List[List[int]]
        :rtype: List[int]
        """
        result = []
    
        # Process each query
        for k, trim in queries:
            # Trim the numbers by slicing the rightmost 'trim' digits
            trimmed = [(num[-trim:], i) for i, num in enumerate(nums)]
            
            # Sort based on the trimmed value, if two are equal, maintain their original index
            trimmed.sort(key=lambda x: (x[0], x[1]))
            
            # The k-th smallest trimmed number's original index
            result.append(trimmed[k-1][1])
        
        return result