# @param {String[]} words
# @return {Integer}
def longest_palindrome(words)
    count = Hash.new(0)
    words.each { |word| count[word] += 1 }

    pairs = 0
    middle = false

    count.each do |word, freq|
        if word[0] == word[1]
            pairs += freq / 2
            if freq % 2 == 1
                middle = true
            end
        else
            reverse_word = word.reverse
            if count[reverse_word] > 0 && word < reverse_word
                pairs += [freq, count[reverse_word]].min
            end
        end
    end
    
    result = pairs * 4
    result += 2 if middle
    result
end