def max_difference(s)
    e, o = s.each_char.tally.values.partition(&:even?)
    o.max - e.min
end