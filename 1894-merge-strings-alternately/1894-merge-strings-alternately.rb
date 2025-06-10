# @param {String} word1
# @param {String} word2
# @return {String}
def merge_alternately(word1, word2) = Array.new([word1.length, word2.length].max).zip(word1.chars, word2.chars).flatten.join
