require 'set'

def bron_kerbosch(p, neighbors_hash, r=[].to_set, x=[].to_set, max_cliques=[].to_set)
  if (p.empty? && x.empty?)
    max_cliques.add(r)
  end

  p.each{ |v|
    bron_kerbosch(p & neighbors_hash[v], neighbors_hash, r | [v].to_set, x & neighbors_hash[v], max_cliques)

    p - [v].to_set
    x | [v].to_set
  }

  max_cliques
end