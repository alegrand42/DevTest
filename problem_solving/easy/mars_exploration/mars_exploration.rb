#!/bin/ruby

require 'json'
require 'stringio'

# Complete the marsExploration function below.
def marsExploration(s)
    arr = []
    while s.length > 0
        arr << s[0..2]
        s = s[3..s.length]
    end
    
    res = 0
    arr.each do |a|
        res += 1 unless a[0] == 'S'
        res += 1 unless a[1] == 'O'
        res += 1 unless a[2] == 'S'
    end
    res
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = marsExploration s

fptr.write result
fptr.write "\n"

fptr.close()