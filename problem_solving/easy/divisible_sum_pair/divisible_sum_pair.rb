#!/bin/ruby

require 'json'
require 'stringio'

# Complete the divisibleSumPairs function below.
def divisibleSumPairs(n, k, ar)
    sum = 0
    ar.each_with_index do |a, i|
        j = i + 1
        while j < ar.length
            sum += 1 if (a + ar[j]) % k == 0
            j+=1
        end
    end
    sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

ar = gets.rstrip.split(' ').map(&:to_i)

result = divisibleSumPairs n, k, ar

fptr.write result
fptr.write "\n"

fptr.close()