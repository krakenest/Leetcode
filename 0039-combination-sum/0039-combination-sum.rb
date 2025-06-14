def combination_sum(candidates, target)
       candidates.sort.flat_map do |candidate|
        if candidate == target
            [[candidate]]
        elsif candidate < target
            combination_sum(candidates.select { |c| c >= candidate }, target - candidate)
                .map { |combo| [candidate] + combo }
        else
            []
        end
    end
end