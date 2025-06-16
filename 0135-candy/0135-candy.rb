# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  chocolate_count = Array.new(ratings.length, 1)

  chocolate_count = allocate_chocolate(ratings, chocolate_count)
  ratings.reverse!
  chocolate_count.reverse!
  chocolate_count = allocate_chocolate(ratings, chocolate_count, true)
  chocolate_count.sum
end

def allocate_chocolate(ratings, chocolate_count, check_reverse_cond = false)
  ratings.each_with_index do |rating, i|
    next if i == 0
    if rating > ratings[i - 1] && (check_reverse_cond ? chocolate_count[i - 1] >= chocolate_count[i] : true)
      chocolate_count[i] = chocolate_count[i - 1] + 1
    end
  end
  chocolate_count
end