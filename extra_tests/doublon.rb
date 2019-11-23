#!/usr/bin/ruby

def get_doublon(arr)
  arr.each_with_object(Hash.new(0)){|a, h| h[a] += 1}.select{|_, v| v > 1}.size
end

arr = %w{1 3 4 3 5 6 4 3}
puts "The array #{arr} has #{get_doublon(arr)} doublons."
