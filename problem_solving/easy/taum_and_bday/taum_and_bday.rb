#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'taumBday' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts following parameters:
#  1. INTEGER b
#  2. INTEGER w
#  3. INTEGER bc
#  4. INTEGER wc
#  5. INTEGER z
#

def taumBday(b, w, bc, wc, z)
    if (wc + z) < bc
        res = (wc + z) * b + wc * w
    elsif (bc + z) < wc
        res = (bc + z) * b + bc * w
    else
        res = bc * b + wc * w
    end
    res  
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.strip.to_i

t.times do |t_itr|
    first_multiple_input = gets.rstrip.split

    b = first_multiple_input[0].to_i

    w = first_multiple_input[1].to_i

    second_multiple_input = gets.rstrip.split

    bc = second_multiple_input[0].to_i

    wc = second_multiple_input[1].to_i

    z = second_multiple_input[2].to_i

    result = taumBday b, w, bc, wc, z

    fptr.write result
    fptr.write "\n"
end

fptr.close()
