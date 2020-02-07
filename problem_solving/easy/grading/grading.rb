#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'gradingStudents' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY grades as parameter.
#

def findMod5(nb)
    return nb if nb < 38
    count = 0
    res = nb
    while count < 5 do
        if (nb + count) % 5 == 0
            res += count if count < 3
            break
        end
        count += 1
    end
    res
end

def gradingStudents(grades)
    grades.map{|elem| findMod5(elem)}
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

grades_count = gets.strip.to_i

grades = Array.new(grades_count)

grades_count.times do |i|
    grades_item = gets.strip.to_i
    grades[i] = grades_item
end

result = gradingStudents grades

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
