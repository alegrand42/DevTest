#!/usr/bin/ruby

class Multiset

  attr_accessor :set

  def initialize(set)
    @set = set
  end

  def &(other)
    @set & other.set
  end

  def |(other)
    @set | other.set
  end
  
  def -(other)
    @set - other.set
  end
end

a1 = %w{1 1 2 2 3 4 5 6}
a2 = %w{1 3 5 6}

x = Multiset.new(a1)
y = Multiset.new(a2)

puts "Arrays: #{a1} and #{a2}"
puts "Difference: #{x - y}"
puts "Union: #{x | y}"
puts "Intersection: #{x & y}"
