#!/bin/ruby

require 'json'
require 'stringio'

# Complete the migratoryBirds function below.
def migratoryBirds(arr)
    res = arr.each_with_object({}){|e, hash| hash[e] = arr.count(e)}
    max = res.max_by{|_, v| v}.last
    res.select{|_, v| v == max}.sort.first.first
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr_count = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

result = migratoryBirds arr

fptr.write result
fptr.write "\n"

fptr.close()