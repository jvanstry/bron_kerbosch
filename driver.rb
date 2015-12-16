require 'benchmark'

require_relative './bron1.rb'
require_relative './bron2.rb'
require_relative './bron3.rb'
require_relative './graph_generator.rb'

neighbors_hash = GraphGenerator.run 70, 30
p = (0..69).to_set

Benchmark.bm do |bm|
  bm.report('Naive Bron-Kerbosch') do 
    bron_kerbosch p, neighbors_hash
  end

  bm.report('Bron-Kerbosch with pivoting') do
    bron_kerbosch_pivot p, neighbors_hash
  end

  bm.report('Bron-Kerbosch with vertex ordering') do
    bron_kerbosch_vertex_ordering p, neighbors_hash
  end
end