#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'getTotalX' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER_ARRAY b
#

def getTotalX(a, b)
    a.each_with_object([]) do |a0, res|
        b.each do |b0|
            res << b0 unless a0 == b0 || b0 % a0 != 0 
        end
    end.uniq.count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

m = first_multiple_input[1].to_i

arr = gets.rstrip.split.map(&:to_i)

brr = gets.rstrip.split.map(&:to_i)

total = getTotalX arr, brr

fptr.write total
fptr.write "\n"

fptr.close()
