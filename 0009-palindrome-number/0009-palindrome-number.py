class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        txt = str(x)
        if txt == txt[::-1]:
            return True
        return False
        