class DegeneracyOrderer
  def self.run neighbors_map
    ordering = []
    degree_arr = []
    degree_map = Hash.new
    cardinality = neighbors_map.length

    neighbors_map.each_pair do |node, neighbors|
      d = neighbors.length
      degree_map[node] = d

      if degree_arr[d] != nil
        degree_arr[d].push(node)
      else
        degree_arr[d] = [node]
      end
    end

    degree_arr.each_index {|i| degree_arr[i] ||= [] }

    cardinality.times do |i|
      lowest_degree_nodes = degree_arr.find{ |x| !x.empty? }

      node_popped = lowest_degree_nodes.pop
      neighbors = neighbors_map[node_popped]

      neighbors.each do |neighbor|
        neighbor_degree = degree_map[neighbor]
        neighbors_map[neighbor].delete(node_popped)

        degree_arr[neighbor_degree].delete(neighbor)

        degree_map[neighbor] -= 1
        degree_arr[degree_map[neighbor]].push(neighbor)
      end
    
      ordering.push(node_popped)
    end

    print ordering
    print "\n"
  end
end