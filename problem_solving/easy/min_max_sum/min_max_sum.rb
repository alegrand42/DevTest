#!/bin/ruby

require 'json'
require 'stringio'

# Complete the miniMaxSum function below.
def miniMaxSum(arr)
    r = (0..(arr.length-1)).map do |index|
        arr.inject(&:+) - arr[index]  
    end
    p r.min, r.max
end

arr = gets.rstrip.split(' ').map(&:to_i)

miniMaxSum arr