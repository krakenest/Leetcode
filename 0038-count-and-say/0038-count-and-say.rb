def count_and_say(n)
  return "1" if n == 1

  res = "1"

  (n - 1).times do
    temp = ""
    i = 0

    while i < res.length
      count = 1

      # \U0001f501 Count same digits
      while i + 1 < res.length && res[i] == res[i + 1]
        count += 1
        i += 1
      end

      temp += "#{count}#{res[i]}" # \U0001f5e3️ Say count & digit
      i += 1
    end

    res = temp
  end

  res
end