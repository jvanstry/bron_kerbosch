require 'set'

def bron_kerbosch_pivot(p, neighbors_hash, r=[].to_set, x=[].to_set, max_cliques=[].to_set)
  if (p.empty? && x.empty?)
    max_cliques.add(r)
  end

  pivot = (p | x).to_a.sample
  
  if p.size > 1
    p - neighbors_hash[pivot]
  end

  p.each{ |v|
    bron_kerbosch_pivot(p & neighbors_hash[v], neighbors_hash, r | [v], x & neighbors_hash[v], max_cliques)
    p - [v].to_set
    x | [v].to_set
  }

  max_cliques
end