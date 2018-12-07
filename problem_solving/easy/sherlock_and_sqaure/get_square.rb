#!/bin/ruby

require 'json'
require 'stringio'

# Complete the squares function below.
def squares(a, b)
    (a..b).select{|n| (Math.sqrt(n) % 1).zero?}.count

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    ab = gets.rstrip.split

    a = ab[0].to_i

    b = ab[1].to_i

    result = squares a, b

    fptr.write result
    fptr.write "\n"
end

fptr.close()
