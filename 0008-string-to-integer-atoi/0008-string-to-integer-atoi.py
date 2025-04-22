class Solution(object):
    def myAtoi(self, s):
        """
        :type s: str
        :rtype: int
        """
        s = s.lstrip()  # Remove leading whitespaces
        if not s:
            return 0

        sign = 1
        i = 0
        if s[0] in ['-', '+']:
            sign = -1 if s[0] == '-' else 1
            i += 1

        result = 0
        while i < len(s) and s[i].isdigit():
            result = result * 10 + int(s[i])
            i += 1

        result *= sign
        INT_MIN, INT_MAX = -2**31, 2**31 - 1
        return max(min(result, INT_MAX), INT_MIN)
        