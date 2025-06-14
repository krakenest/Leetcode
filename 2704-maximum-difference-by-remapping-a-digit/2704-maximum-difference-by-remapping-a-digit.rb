class Array
    def to_d = reverse_each.inject(0) {|res, d| res * 10 + d }

    def subst(f, t) = collect {|d| d == f ? t : d }
end


def min_max_difference(num)
    rd = (dig = num.digits).rindex {|d| d < 9 }
    (rd.nil? ? num : dig.subst(dig[rd], 9).to_d) - dig.subst(dig.last, 0).to_d
end