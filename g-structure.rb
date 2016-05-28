require 'set'

require_relative("graph_generator")

class GStructure
  attr_accessor :neighbors_map, :vertexDegreeMap

  def initialize neighbors_map
    @neighbors_map = neighbors_map
    @vertexDegreeMap = Hash.new

    neighbors_map.each_pair{ |key, value|
      vertexDegreeMap[key] = value.length
    }
  end

  def equals? otherGStructure
    # I have now run into the graph isomorphism problem... a notoriously 
    # difficult CS problem, with only NP running time known solutions
    # Therefore I have concluded my comparison of running times, this one, as implemented
    # in the fashion that I did... is slower than the polynomial running times
    # of the previously implemented Bron Kerbosch family of algorithms.

    my_matrix = self.to_Matrix
    their_matrix = otherGStructure.to_Matrix

    my_matrix.each_with_index { |row, i|
      return false if row != their_matrix[i]
    }

    true
  end

  def to_Matrix
    matrix_array = []

    @neighbors_map.each_pair { |key, value|
      str = "".ljust(@neighbors_map.size, '0')
      str.insert(key, '1')

      value.each { |neighbor|
        str.insert(neighbor, '1')
      }

      matrix_array << str
    }

    matrix_array.sort
  end

  def refine
    lowestCurrentDegree = @vertexDegreeMap.size + 1
    lowestDegreeVertex = @vertexDegreeMap.size + 1

    @vertexDegreeMap.each_pair{ |key, value|
      if value < lowestCurrentDegree && value > 0 
        lowestCurrentDegree = value
        lowestDegreeVertex = key
      end
    }

    if lowestCurrentDegree != @vertexDegreeMap.size + 1
      neighbor_to_remove = @neighbors_map[lowestDegreeVertex].shift

      @vertexDegreeMap[lowestDegreeVertex] -= 1
      @vertexDegreeMap[neighbor_to_remove] -= 1

      @neighbors_map[neighbor_to_remove] -= [lowestDegreeVertex]
    end

    [lowestDegreeVertex, neighbor_to_remove]
  end
end