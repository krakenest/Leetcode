
# @param {String} s1
# @param {String} s2
# @param {String} base_str
# @return {String}

class Solver
    attr_reader :tt

    def find(c) = (c == tt[c] ? c : @tt[c] = find(tt[c]))

    def union(c1, c2)
        c1, c2 = find(c1), find(c2)
        unless c1 == c2
            c1, c2 = c2, c1 if c1 < c2
            @tt[c1] = c2
        end
    end

    def initialize(s1, s2)
        @tt = Hash.new {|h, k| h[k] = k }
        s1.each_char.with_index {|c1, i1| union(c1, s2[i1]) }
    end

    def solve(s) = s.each_char.collect {|c| find(c) }.join('')
end

def smallest_equivalent_string(s1, s2, base_str) = Solver.new(s1, s2).solve(base_str)