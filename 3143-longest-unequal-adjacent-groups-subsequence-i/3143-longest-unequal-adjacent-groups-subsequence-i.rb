# @param {String[]} words
# @param {Integer[]} groups
# @return {String[]}
def get_longest_subsequence(words, groups)
    last_bit = 1 - groups.first
    words.zip(groups).drop(1).each_with_object([words.first]) {|wg, res| 
        (res << wg.first; last_bit = 1 - wg.last) if last_bit == wg.last
    }
end