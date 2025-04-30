class Solution(object):
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        digit_to_letters = {
            '2': ['a', 'b', 'c'],
            '3': ['d', 'e', 'f'],
            '4': ['g', 'h', 'i'],
            '5': ['j', 'k', 'l'],
            '6': ['m', 'n', 'o'],
            '7': ['p', 'q', 'r', 's'],
            '8': ['t', 'u', 'v'],
            '9': ['w', 'x', 'y', 'z']
        }

        # Base case: if input digits is empty, return an empty list
        if not digits:
            return []
        
        # Result list to store the combinations
        result = []

        # Helper function for backtracking
        def backtrack(index, current_combination):
            # If the current combination is the length of the digits, we've formed a valid combination
            if index == len(digits):
                result.append(current_combination)
                return
            
            # Get the letters for the current digit
            current_digit = digits[index]
            for letter in digit_to_letters[current_digit]:
                # Recursively build the combinations
                backtrack(index + 1, current_combination + letter)

        # Start backtracking from the first digit
        backtrack(0, "")
        
        return result