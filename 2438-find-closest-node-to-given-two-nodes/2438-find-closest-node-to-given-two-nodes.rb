def get_distances(edges, start)
  n = edges.length
  dist = Array.new(n, -1)
  d = 0
  while start != -1 && dist[start] == -1
    dist[start] = d
    d += 1
    start = edges[start]
  end
  dist
end

def closest_meeting_node(edges, node1, node2)
  dist1 = get_distances(edges, node1)
  dist2 = get_distances(edges, node2)
  result = -1
  min_distance = Float::INFINITY

  (0...edges.length).each do |i|
    if dist1[i] != -1 && dist2[i] != -1
      max_dist = [dist1[i], dist2[i]].max
      if max_dist < min_distance
        min_distance = max_dist
        result = i
      end
    end
  end
  result
end