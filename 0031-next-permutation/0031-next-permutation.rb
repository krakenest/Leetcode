# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
class Array
    def swap!(i1, i2)
        self[i1], self[i2] = values_at(i2, i1)
        self
    end
    
    def reverse_from!(from)
        self[from..-1] = self[from..-1].reverse!
        self
    end
end

def next_permutation(nums)
    x = (nums.size-1).downto(1).inject(nil) {|r, i| break (i - 1) if nums[i-1] < nums[i] }
    return nums.reverse! if x.nil?
    y = (nums.size - 1).downto(x + 1).inject(nil) {|r, i| break i if nums[x] < nums[i] }
    nums.swap!(x, y).reverse_from!(x+1)
end