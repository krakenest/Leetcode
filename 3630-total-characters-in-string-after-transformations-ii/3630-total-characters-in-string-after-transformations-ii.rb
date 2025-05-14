# @param {String} s
# @param {Integer} t
# @param {Integer[]} nums
# @return {Integer}
class String
    AORD = 'a'.ord
    NCHARS = 'z'.ord - AORD + 1

    def aord = (ord - AORD)

    def freq = each_byte.with_object(Array.new(NCHARS, 0)) {|b, res| res[b - AORD] += 1 }
end

class Array
    MOD = 10**9 + 7

    def Array.scalar(n, v) = n.times.collect {|i| n.times.collect {|j| i == j ? v : 0 } }

    def Array.identity(n) = Array.scalar(n, 1)

    def Array.zero(n) = Array.scalar(n, 0)

    def modmul(om)
        size.times.with_object(Array.zero(size)) {|i, res|
            size.times {|r|
                next if (a = self[i][r]).zero?
                size.times {|j|
                    res[i][j] = (res[i][j] + a * om[r][j] % MOD) % MOD
                }
            }
        }
    end

    def modsqr = (self.modmul(self))

    def modpow(pow)
        base = self
        pow.bit_length.times.inject(Array.identity(String::NCHARS)) {|res, i|
            (res, base = (pow[i].zero? ? res : res.modmul(base)), base.modsqr).first
        }
    end
end

class Solver
    attr_reader :nums

    def initialize(nums)
        @nums = nums
    end

    def solve(s, t)
        fq = s.freq
        m = String::NCHARS.times.with_object(Array.scalar(String::NCHARS, 0)) {|i, res| nums[i].times.each {|j| res[i][(i+j+1) % String::NCHARS] += 1 } }
        mt = m.modpow(t)
        fq.each_with_index.inject(0) {|res, (f, i)|
            next res if f.zero?
            add = String::NCHARS.times.inject(0) {|res1, j| 
                    (res1 + 
                        f * mt[i][j] % Array::MOD
                    ) % Array::MOD
                }
            (res + add) % Array::MOD
        }
    end
end

def length_after_transformations(s, t, nums) = Solver.new(nums).solve(s, t)