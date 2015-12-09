class GraphGenerator

  def self.run num_vertices, connectedness
    neighbors_map = Hash.new

    num_vertices.times do |i|
      neighbors_map[i] = []

      num_vertices.times do |j|
        next if i == j

        random_number = rand(100)

        if random_number <= connectedness
          neighbors_map[i].push(j)
        end
      end
    end

    neighbors_map
  end
end
