class NilClass
    def min(v) = v
    def max(v) = v
end

class Numeric
    def min(v) = (self < v ? self : v)
    def max(v) = (self > v ? self : v)
end

class Array
    def set_max(i, j, v)
        self[i][j] = dig(i, j).max(v)
    end

    def set_min(i, j, v)
        self[i][j] = dig(i, j).min(v)
    end
end

def status(ca, cb) = (ca[0] << 1 | cb[0])

def max_difference(s, k)
    ps = ('0'..'4').each_with_object({}) {|d, res| res[d] = s.each_char.inject([0]) {|res1, c| res1 << res1.last + (c == d ? 1 : 0) } }
    ans = nil
    ('0'..'4').each {|a|
        ps1 = ps[a]
        (('0'...a).each + (a.next..'4').each).each {|b|
            ps2 = ps[b]
            j, g = 0, [[nil, nil], [nil, nil]]
            (k..s.size).each {|i|
                while i - j >= k && ps1[i] > ps1[j] && ps2[i] > ps2[j] do
                    g.set_max(ps1[j][0], ps2[j][0], ps2[j] - ps1[j])
                    j += 1
                end
                best = g[1-ps1[i][0]][ps2[i][0]]
                ans = ans.max(ps1[i] - ps2[i] + best) unless best.nil?
            }
        }
    }
    ans
end