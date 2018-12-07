#!/bin/ruby

require 'json'
require 'stringio'

class MagickSquare

    def magick_number
        n = 3
        (n+(n^3))/2
    end

    def row0
        @s[0][0] + @s[0][1] + @s[0][2]
    end

    def row1
        @s[1][0] + @s[1][1] + @s[1][2]
    end

    def row2
        @s[2][0] + @s[2][1] + @s[2][2]
    end

    def col0
        @s[0][0] + @s[1][0] + @s[2][0]
    end

    def col1
        @s[1][0] + @s[1][1] + @s[2][1]
    end

    def col2
        @s[1][2] + @s[1][2] + @s[2][2]
    end

    def diag1
        @s[0][0] + @s[1][1] + @s[2][2]
    end

    def diag2
        @s[0][2] + @s[1][1] + @s[2][0]
    end

    def show_detail(type, sum)
        m = magick_number
        puts "#{type}:"
        puts "S = #{sum}"
        res = (m - sum).abs
        puts "N = |M-S| = |#{m}-#{sum}| = #{res}"
        res
    end

    def display_data
        sum = 0
        sum += show_detail("Line 1", row0)
        puts "\n"
        sum += show_detail("Line 2", row1)
        puts "\n"
        sum += show_detail("Line 3", row2)
        puts "\n"
        sum += show_detail("Column 1", col0)
        puts "\n"
        sum += show_detail("Column 2", col1)
        puts "\n"
        sum += show_detail("Column 3", col2)
        puts "\n"
        sum += show_detail("Diagonal 1", diag1)
        puts "\n"
        sum += show_detail("Diagonal 2", diag2)
        puts "\n"
        puts "Fitness = sum of all N values = #{sum}"
    end

    def initialize(s)
        @s = s
    end

end
# Complete the formingMagicSquare function below.
def formingMagicSquare(s)
s[1][1]

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = Array.new(3)

3.times do |i|
    s[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = formingMagicSquare s

fptr.write result
fptr.write "\n"

fptr.close()
