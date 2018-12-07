#!/bin/ruby

require 'json'
require 'stringio'

# Complete the saveThePrisoner function below.
def saveThePrisoner(n, m, s)
    res = ((m - 1) + s) % n
    res == 0 ? n : res 
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    nms = gets.rstrip.split

    n = nms[0].to_i

    m = nms[1].to_i

    s = nms[2].to_i

    result = saveThePrisoner n, m, s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
