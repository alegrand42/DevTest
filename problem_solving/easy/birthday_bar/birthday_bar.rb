#!/bin/ruby

require 'json'
require 'stringio'

# Complete the birthday function below.
def birthday(s, d, m)
    res = []
    s.each_with_index do |sq, i|
        sum = sq
        (m - 1).times do |n|
            sum = 0 unless s[i+n + 1]
            sum += s[i + n + 1] if s[i + n + 1] 
        end
        res << sum
    end
    res.count(d)
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.strip.to_i

s = gets.rstrip.split.map(&:to_i)

dm = gets.rstrip.split

d = dm[0].to_i

m = dm[1].to_i

result = birthday s, d, m

fptr.write result
fptr.write "\n"

fptr.close()