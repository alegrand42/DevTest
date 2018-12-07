#!/bin/ruby

require 'json'
require 'stringio'


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

# Complete the workbook function below.
def workbook(n, k, arr)
    c = 1
    h = {}
    arr.each do |a|
        ar = []
        (1..a).each_with_index do |nb, i|
            ar << nb
            if (i + 1) % k == 0 && i != 0
                h[c] = ar
                ar = []
                c += 1
            end
        end
        unless ar.empty?
        h[c] = ar 
        c += 1
        end
    end
    c = 0
    h.each{|k, v| c += 1 if v.include? k}
    c
end
nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

arr = gets.rstrip.split(' ').map(&:to_i)

result = workbook n, k, arr

fptr.write result
fptr.write "\n"