#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumDistances function below.
def minimumDistances(a)
    arr = a.uniq.select{|a0| a.count(a0) > 1}
    return -1 if arr.empty?
    arr.map do |a0|
        arr = a.each_with_index.select{|s, i| i if s == a0}.map{|k, v| v}
        arr[1] - arr[0]
    end.min
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

a = gets.rstrip.split(' ').map(&:to_i)

result = minimumDistances a

fptr.write result
fptr.write "\n"

fptr.close()

