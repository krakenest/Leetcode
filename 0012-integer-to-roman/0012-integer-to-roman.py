class Solution(object):
    def intToRoman(self, num):
        """
        :type num: int
        :rtype: str
        """
        val = [
            1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
        ]
        syb = [
            "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"
        ]
        roman = ""

        for i in range(len(val)):
            while num >= val[i]:
                roman += syb[i]
                num -= val[i]

        return roman
