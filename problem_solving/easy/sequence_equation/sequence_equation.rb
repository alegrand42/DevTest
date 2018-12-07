#!/bin/ruby

require 'json'
require 'stringio'

# Complete the permutationEquation function below.
def permutationEquation(p)
    res = []
    (1..p.length).each do |i|
        val =  p.index(i) + 1
        res << p.index(val) + 1
    end
    res
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

p = gets.rstrip.split(' ').map(&:to_i)

result = permutationEquation p

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
