# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
    flowerbed.each_with_index do |i, index|
        next if i == 1
        left_zero = index == 0 || flowerbed[index - 1] == 0
        right_zero = index == flowerbed.length - 1 ||  flowerbed[index + 1] == 0
        if left_zero && right_zero
            n = n - 1
            flowerbed[index] = 1
        end
    end

    n <= 0
end