class GraphGenerator
  def self.run num_vertices, connectedness
    # connectedness is overall percentage that an edge is present in graph 
    # it has to get halved because we are looping through each potential edge
    # creation twice

    neighbors_map = Hash.new
    percentage_success_for_edge_creation = connectedness / 2

    num_vertices.times do |i|
      neighbors_map[i] = [] if neighbors_map[i] == nil

      num_vertices.times do |j|
        next if i == j

        random_number = rand(100)

        if random_number <= percentage_success_for_edge_creation
          neighbors_map[i].push(j)
          neighbors_map[j] = [] if neighbors_map[j] == nil
          neighbors_map[j].push(i)

          neighbors_map[i].uniq!
          neighbors_map[j].uniq!
        end
      end
    end
    neighbors_map
  end
end
