#!/bin/ruby

#
# Complete the pageCount function below.
#
def pageCount(n, p)
    r = [0, 0]
 (0..n).each_slice(2).each_with_index{|e, i| r[0] = i if e.include?(p)}
 (0..n).each_slice(2).to_a.reverse.each_with_index{|e, i| r[1] = i if e.include?(p)}
 r.min
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

p = gets.to_i

result = pageCount n, p

fptr.write result
fptr.write "\n"

fptr.close()
