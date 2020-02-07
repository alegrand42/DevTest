#!/bin/ruby

require 'json'
require 'stringio'

# Complete the breakingRecords function below.
def breakingRecords(scores)
    first = [scores[0], scores[0]]
    scores.each_with_object({max: 0, min: 0}) do |score, hash|
        p "hash: #{hash} score: #{score} first: #{first}"
        if score < first[1]
            hash[:min] += 1
            first[1] = score
        end
        if score > first[0]
            hash[:max] += 1
            first[0] = score
        end
    end.values
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

scores = gets.rstrip.split(' ').map(&:to_i)

result = breakingRecords scores

fptr.write result.join " "
fptr.write "\n"

fptr.close()
