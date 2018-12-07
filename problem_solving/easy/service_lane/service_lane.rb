#!/bin/ruby

require 'json'
require 'stringio'

# Complete the serviceLane function below.
def serviceLane(cases, width)
    res = []
    cases.each do |c1, c2|
        res << (c1..c2).each_with_object([]) do |c, ar|
            ar << width[c]
        end.min
    end
    res
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nt = gets.rstrip.split

n = nt[0].to_i

t = nt[1].to_i

width = gets.rstrip.split(' ').map(&:to_i)

cases = Array.new(t)

t.times do |i|
    cases[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = serviceLane cases, width

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()