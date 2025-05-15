# @param {Integer[]} digits
# @return {Integer[]}
def find_even_numbers(digits)
    (100..998).step(2).select { |num| num.to_s.chars.tally.all? { |k,v| digits.count(k.to_i) >= v } }
end