# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
    nr, nw, nb = nums.each_with_object([0, 0, 0]) {|v, res| res[v] += 1 }
    nums[0...nr] = Array.new(nr, 0) if nr > 0
    nums[nr...nr + nw] = Array.new(nw, 1) if nw > 0
    nums[nr+nw...nr+nw+nb] = Array.new(nb, 2) if nb > 0
end