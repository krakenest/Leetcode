# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  stack = [-1]
  max = 0
  
  s.chars.each_with_index do |char, i|
    if char == '('
      stack << i
    else
      stack.pop
      
      if stack.empty?
        stack << i
      else
        max = [max, i - stack.last].max
      end
    end
  end
  
  max
end