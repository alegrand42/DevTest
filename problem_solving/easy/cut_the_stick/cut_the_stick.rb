#!/bin/ruby

require 'json'
require 'stringio'

# Complete the cutTheSticks function below.
def cutTheSticks(arr)
    size = arr.count
    i = size
    r = [size]
    while i > 1
    break if arr.empty?
    minus = Array.new(arr.count, arr.min)
    res = arr.each_with_index.map{|a, i| a - minus[i]}
    res -= [0]
    r << r.last - (arr.count - res.count)
    arr = res
    i -= 1
    end
r -= [0]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

result = cutTheSticks arr

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
