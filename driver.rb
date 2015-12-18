require 'benchmark'

require_relative './bron1.rb'
require_relative './bron2.rb'
require_relative './bron3.rb'
require_relative './graph_generator.rb'

number_of_nodes = [100, 100, 100, 250, 250]
chance_of_each_edge = [10, 40, 46, 8, 24]

number_of_nodes.each_with_index do |num, i|
  puts "#{num} nodes and #{chance_of_each_edge[i]}% chance of each edge\n"

  neighbors_hash = GraphGenerator.run num, chance_of_each_edge[i]
  p = (0..(num - 1)).to_set

  Benchmark.bm do |bm|
    bm.report('Naive Bron-Kerbosch  ') do 
      bron_kerbosch p, neighbors_hash
    end

    bm.report('Bron-Kerbosch Pivot  ') do
      bron_kerbosch_pivot p, neighbors_hash
    end

    bm.report('Bron-Kerbosch w/ VO  ') do
      bron_kerbosch_vertex_ordering p, neighbors_hash
    end
    puts
  end
end