MOD = 10**9 + 7
def length_after_transformations(s, t)
    d = {
      'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7,
      'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15,
      'q' => 16, 'r' => 17, 's' => 18, 't' => 19, 'u' => 20, 'v' => 21, 'w' => 22, 'x' => 23,
      'y' => 24, 'z' => 25
    }

    
    ans = 0
    memo = {}

    # Recursive count method
    def count(c, memo)
      return 1 if c < 26
      return memo[c] if memo.key?(c)

      temp = count(c - 26, memo) + count(c - 25, memo)
      memo[c] = temp
      temp
    end

    # Loop through each character in the string `s`
    s.each_char do |l|
      ans += count(d[l] + t, memo)
    end

    ans % MOD
end