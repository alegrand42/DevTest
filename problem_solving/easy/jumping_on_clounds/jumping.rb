#!/bin/ruby

require 'json'
require 'stringio'

# Complete the jumpingOnClouds function below.
def jumpingOnClouds(c)
    res = Array.new(2, 0)
    c.each_with_index do |c0, i|
        next if i < res[0]
        if c[i+ 2] == 0
            res = [i+2, res[1] + 1]
        elsif c[i+ 1] == 0
            res = [i+1, res[1] + 1]
        end
    end
    res[1]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

c = gets.rstrip.split(' ').map(&:to_i)

result = jumpingOnClouds c

fptr.write result
fptr.write "\n"

fptr.close()