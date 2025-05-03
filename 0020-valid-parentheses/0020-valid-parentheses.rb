# @param {String} s
# @return {Boolean}
def is_valid(s)
    stack = []
    bracket_map = { ')' => '(', '}' => '{', ']' => '[' }
    s.each_char do |char|
        if bracket_map.key?(char)
            top_element = stack.empty? ? '#' : stack.pop
            return false if top_element != bracket_map[char]
        else
            stack.push(char)
        end 
    end
    stack.empty?
end