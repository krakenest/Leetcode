class Solution(object):
    def pushDominoes(self, dominoes):
        """
        :type dominoes: str
        :rtype: str
        """
        n = len(dominoes)
        forces = [0] * n  # Forces array to store force from left and right
        
        # Left to right pass (forces from 'R')
        force = 0
        for i in range(n):
            if dominoes[i] == 'R':
                force = n  # Large force when 'R' is encountered
            elif dominoes[i] == 'L':
                force = 0  # No force after 'L'
            elif force > 0:
                force -= 1  # Decrease force as we move right
            forces[i] = force
        
        # Right to left pass (forces from 'L')
        force = 0
        for i in range(n-1, -1, -1):
            if dominoes[i] == 'L':
                force = n  # Large force when 'L' is encountered
            elif dominoes[i] == 'R':
                force = 0  # No force after 'R'
            elif force > 0:
                force -= 1  # Decrease force as we move left
            # If there's a conflict, resolve it by keeping the upright state (.)
            forces[i] -= force
        
        # Construct the result string
        result = []
        for i in range(n):
            if forces[i] > 0:
                result.append('R')
            elif forces[i] < 0:
                result.append('L')
            else:
                result.append('.')
        
        return ''.join(result)
        