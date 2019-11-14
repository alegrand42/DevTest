#!/bin/ruby

require 'json'
require 'stringio'

# Complete the pangrams function below.
def pangrams(s)
    a = s.split('').map(&:downcase).uniq.sort - [' ']
    a == ('a'..'z').to_a ? 'pangram' : 'not pangram'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = pangrams s

fptr.write result
fptr.write "\n"

fptr.close()