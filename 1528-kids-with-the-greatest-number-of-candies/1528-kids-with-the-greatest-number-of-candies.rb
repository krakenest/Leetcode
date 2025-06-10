# @param {Integer[]} candies
# @param {Integer} extra_candies
# @return {Boolean[]}
def kids_with_candies(candies, extra_candies)
    greatest_candies = candies.max
    kids_with_extra = candies.map{|i| (i+ extra_candies) >= greatest_candies}
end