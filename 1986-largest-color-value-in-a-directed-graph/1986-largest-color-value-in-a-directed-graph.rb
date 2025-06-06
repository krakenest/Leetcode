# Leetcode: 1857. Largest Color Value in a Directed Graph.
# https://leetcode.com/problems/largest-color-value-in-a-directed-graph/
# = = = = = = = = = = = = = = 
# Accepted.
# Thanks God, Jesus Christ!
# = = = = = = = = = = = = = =
# Runtime: 1050 ms, faster than 100.00% of Ruby online submissions for Largest
# Color Value in a Directed Graph.
# Memory Usage: 277.7 MB, less than 100.00% of Ruby online submissions for
# Largest Color Value in a Directed Graph.
# 2023.04.09 Daily Challenge.
# @param {String} colors
# @param {Integer[][]} edges
# @return {Integer}
def largest_path_value(colors, edges)
  # Based on:
  # https://leetcode.com/problems/largest-color-value-in-a-directed-graph/solution/
  n = colors.size
  adj = Array.new(n).map{ [] } 
  indegree = Array.new(n,0)
  edges.each do |a,b|
    adj[a].push(b)
    indegree[b] += 1
  end
  count = Array.new(n).map{ [0]*26 }
  q = []
  (0...n).each do |i|
    q.push(i) if 0 == indegree[i]
  end
  answer, nodesSeen = 0 ,0
  while !q.empty? 
    node = q.shift
    count[node][colors[node].ord - ?a.ord] += 1
    answer = [answer,count[node][colors[node].ord - ?a.ord]].max
    nodesSeen += 1
    adj[node].each do |neighbor|
      (0...26).each do |i|
        count[neighbor][i] = [count[neighbor][i],count[node][i]].max
      end
      indegree[neighbor] -= 1
      q.push(neighbor) if 0 == indegree[neighbor]

    end
  end
  return nodesSeen < n ? -1 : answer
end