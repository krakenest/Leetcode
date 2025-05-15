# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
  cnt = 0
  arr.each do |x|
    if x.odd?
      cnt += 1
      return true if cnt == 3
    else
      cnt = 0
    end
  end
  false
end