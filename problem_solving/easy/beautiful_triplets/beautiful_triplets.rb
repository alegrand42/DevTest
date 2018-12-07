#!/bin/ruby

require 'json'
require 'stringio'

# Complete the beautifulTriplets function below.
def beautifulTriplets(d, arr)
    sum = 0
    size = arr.count - 1
    (0..size).each do |i|
        (i..size).each do |j|
            (j..size).each do |k|
                sum += 1 if arr[j] - arr[i] == d && arr[k] - arr[j] == d
            end
        end
    end
    sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nd = gets.rstrip.split

n = nd[0].to_i

d = nd[1].to_i

arr = gets.rstrip.split(' ').map(&:to_i)

result = beautifulTriplets d, arr

fptr.write result
fptr.write "\n"

fptr.close()
