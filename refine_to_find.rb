require 'set'

require_relative("graph_generator")
require_relative("g-structure")

NUMBER_VERTICES = 5

neighbors_map = Hash[0, [1, 2], 1, [0, 2], 2, [0, 1], 3, [4], 4, [3]]

gStructUnderInvestigation = GStructure.new neighbors_map

completeGraph = GraphGenerator.build_complete_graph NUMBER_VERTICES
maxCliques = [(0..(NUMBER_VERTICES - 1)).to_set]
referenceStructure = GStructure.new completeGraph

while (!referenceStructure.equals? gStructUnderInvestigation)
  edgeRemoved = referenceStructure.refine

  maxCliques.each_index { |i|

    if ((maxCliques[i].include? edgeRemoved.first) && (maxCliques[i].include? edgeRemoved.last))
      cliqueFirstVertexRemoved = (maxCliques[i] - [edgeRemoved.first].to_set)
      cliqueSecondVertexRemoved = (maxCliques[i] - [edgeRemoved.last].to_set)

      maxCliques[i] = [cliqueFirstVertexRemoved, cliqueSecondVertexRemoved]
    end
  }
  
  maxCliques.flatten!
end

maxCliques.each { |clique|
  puts "New Clique"
  clique.each { |val|
    print val
  }
  puts ## prints new line
}