# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
    result = []

    len = words.first.length
    words_count = words.size

    to_see = words.tally
    to_see.default = 0

    # Pass through s in len-chunks len times
    len.times do |head|
        # Advance "pointers" head and tail through indices of s with same mod(len) 
        # and track which words the substr between them has
        tail = head
        seen = Hash.new(0) # words substr already has
        seen_count = 0 # should always == seen.values.sum

        while tail < s.length
            w = s[tail, len] # next word to add to substr
            if seen[w] < to_see[w]
                # accept w and advance tail
                tail += len
                seen[w] += 1
                seen_count += 1
                result << head if seen_count == words_count
            elsif to_see[w] > 0
                # reject already-seen w, advance head
                seen[s[head, len]] -= 1
                seen_count -= 1
                head += len
            else
                # w is not in words, reset and advance
                seen.clear if seen_count > 0
                seen_count = 0
                head = tail += len
            end
        end
    end
    result
end