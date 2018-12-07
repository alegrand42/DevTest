#!/bin/ruby

require 'json'
require 'stringio'

def checkKrapeker(n)
    return true if n == 1
    square = n * n
    str = square.to_s
    m0 = str.size / 2 - 1
    m1 = str.size / 2
    n0 = str.slice(0..m0).to_i
    n1 = str.slice(m1..-1).to_i
    (n0 + n1) == n
end

# Complete the kaprekarNumbers function below.
def kaprekarNumbers(p, q)
    r = (p..q).each_with_object([]) do |n, res|
        res << n if checkKrapeker(n)
    end.join(" ")
    puts r
end

p = gets.to_i

q = gets.to_i

kaprekarNumbers p, q