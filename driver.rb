# require_relative './bron1.rb'
# require_relative './bron2.rb'
# require_relative './bron3.rb'
# require_relative './graph_generator.rb'
require_relative './degeneracy_orderer.rb'

# neighbors_hash = GraphGenerator.run(1000, 50)

neighbors_hash = Hash[1, [2, 3], 2, [1, 3, 5], 3, [1, 2, 4, 5], 4, [3], 5, [2, 3]]

DegeneracyOrderer.run neighbors_hash