# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
class Numeric
    def min(v) = (self < v ? self : v)
    def max(v) = (self > v ? self : v)
end

IMPOS = -1

def min_sum(nums1, nums2)
    sum1 = nums1.sum
    n0s1 = nums1.count(0)
    sum2 = nums2.sum
    n0s2 = nums2.count(0)

    case (n0s1.zero? ? 0 : 1) + (n0s2.zero? ? 0 : 2)
        when 3
            (sum1 + n0s1).max(sum2 + n0s2)
        when 2
            (sum2 + n0s2) > sum1 ? IMPOS : sum1.max(sum2 + n0s2)
        when 1
            (sum1 + n0s1) > sum2 ? IMPOS : sum2.max(sum1 + n0s1)
        when 0
            sum1 == sum2 ? sum1 : IMPOS
    end
end