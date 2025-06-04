def answer_string(word, num_friends)
  return word if num_friends == 1
  cnt = (sz = word.size) - num_friends + 1
  word.enum_for(:scan, /#{word.chars.max}/).map { Regexp.last_match.begin(0) }
    .map { |i| word[i...[i + cnt, sz].min] }.max
end