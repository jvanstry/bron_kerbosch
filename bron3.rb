require 'set'
require_relative './bron2'
require_relative './degeneracy_orderer.rb'

def bron_kerbosch_vertex_ordering(p, neighbors_hash, r=[].to_set, x=[].to_set, max_cliques=[].to_set)
  duped_neighbors_hash = Hash.new
  neighbors_hash.each_key { |key| duped_neighbors_hash[key] = neighbors_hash[key].dup }

  degen_ordering = DegeneracyOrderer.run duped_neighbors_hash

  degen_ordering.each { |node|
    max_cliques = max_cliques | bron_kerbosch_pivot(p & neighbors_hash[node].to_set, neighbors_hash, 
      r | [node].to_set, x & neighbors_hash[node].to_set)

    p = p - [node].to_set
    x = x | [node].to_set
  }
  max_cliques
end