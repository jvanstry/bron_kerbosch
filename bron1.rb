require 'set'

def bron_kerbosch(p, neighbors_hash, r=[].to_set, x=[].to_set, max_cliques=[].to_set)
  if (p.empty? && x.empty?)
    max_cliques.add(r)
  end

  p.each{ |v|
    bron_kerbosch(p & neighbors_hash[v], neighbors_hash, r | [v], x & neighbors_hash[v], max_cliques)

    p - [v].to_set
    x | [v].to_set
  }

  max_cliques
end

neighbors_hash = Hash[1, [2,3], 2, [1, 3], 3, [1, 2, 4], 4, [3]]
p = [1, 2, 3, 4].to_set
jer =  bron_kerbosch p, neighbors_hash
puts jer.inspect

