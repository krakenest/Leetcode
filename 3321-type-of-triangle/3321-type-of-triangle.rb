# @param {Integer[]} nums
# @return {String}
def triangle_type(sides)
    equal_count = 0

    return "none" unless [
        [0,1,2],
        [1,2,0],
        [2,1,0]
    ].all? do |a, b, c|
        sides[a] < sides[b] + sides[c]
    end
    
    ["equilateral", "isosceles", "scalene"][sides.uniq.length - 1]
end