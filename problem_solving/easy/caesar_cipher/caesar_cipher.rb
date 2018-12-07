#!/usr/bin/ruby

require 'json'
require 'stringio'

# Complete the caesarCipher function below.
def caesarCipher(s, k)
    s.chars.map do |e|
        e = e.ord
        case e
        when 97..122
            e + k > 122 ? (e + k - 122 + 97 - 1) : e + k
        when 65..90
            e + k > 90 ? (e + k - 90 + 65 - 1) : e + k 
        else
            e 
        end
    end.map{|e| e.chr}.join
end

fptr = File.open('test.txt', 'w')

n = gets.to_i

s = gets.to_s.rstrip

k = gets.to_i

result = caesarCipher s, k

fptr.write result
fptr.write "\n"

fptr.close()

