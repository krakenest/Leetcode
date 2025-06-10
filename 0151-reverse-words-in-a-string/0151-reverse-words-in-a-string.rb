def reverse_words(s)
    # remove inner, trailing and leading space
    i = 0
    s[i] = "" while s[i] == ' '
    j = s.size - 1
    while s[j] == ' '
      s[j] = ""
      j -= 1
    end
    while i < j
      if s[i] == s[i + 1] && s[i] == " "
        s[i] = ""
        i -= 1
      end
      i += 1
    end
    p s
    # reverse string
    i = 0
    j = s.size - 1
    while i < j
      s[i], s[j] = s[j], s[i]
      i += 1
      j -= 1
    end
    # reverse every word before space and end of string
    i = 0
    tracker = 0
    n = s.size
    while i < n
      if s[i] == ' '
        left = tracker
        right = i - 1
        while left < right
          s[left], s[right] = s[right], s[left]
          left += 1
          right -= 1
        end
        tracker = i + 1
      end
      i += 1
    end
    ##### reverse last word too
    left = tracker
    right = i - 1
    while left < right
        s[left], s[right] = s[right], s[left]
        left += 1
        right -= 1
    end
    s
end