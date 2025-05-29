# @param {Integer[][]} edges1
# @param {Integer[][]} edges2
# @return {Integer[]}
def max_target_nodes(edges1, edges2)
    m = edges1.length + 1  # number of nodes in tree1
    n = edges2.length + 1  # number of nodes in tree2

    # Build adjacency list for both trees
    graph1 = build_graph(edges1, m)
    graph2 = build_graph(edges2, n)

    # Get bipartite coloring for both trees (0 and 1 for even/odd levels)
    color1 = get_bipartite_coloring(graph1)
    color2 = get_bipartite_coloring(graph2)

    # Count how many nodes in each tree are colored 0 or 1
    count1_0 = color1.count(0)
    count1_1 = color1.count(1)
    count2_0 = color2.count(0)
    count2_1 = color2.count(1)

    # Best we can get from tree2 is the larger of the two color groups
    max_tree2_odd = [count2_0, count2_1].max

    result = Array.new(m)

    # For each node in tree1
    (0...m).each do |i|
        # Count how many nodes in its own tree are at even distance (same color)
        tree1_even = (color1[i] == 0) ? count1_0 : count1_1

        # Combine with max we can get from tree2
        result[i] = tree1_even + max_tree2_odd
    end

    result
end

# Builds adjacency list from edge list
def build_graph(edges, size)
    graph = Array.new(size) { [] }
    edges.each do |u, v|
        graph[u] << v
        graph[v] << u
    end
    graph
end

# Returns array with 0/1 coloring for bipartite tree using BFS
def get_bipartite_coloring(graph)
    color = Array.new(graph.length, -1)  # -1 means unvisited
    queue = [0]
    color[0] = 0  # Start from node 0 with color 0

    while !queue.empty?
        node = queue.shift

        graph[node].each do |neighbor|
            if color[neighbor] == -1
                color[neighbor] = 1 - color[node]  # Alternate color
                queue << neighbor
            end
        end
    end

    color
end