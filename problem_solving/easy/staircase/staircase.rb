#!/usr/bin/ruby

def staircase(n)
  n.times do |i|
    s = ""
    n.times do |j|
      s += i >= (n -j - 1) ? '#' : ' '
    end
    p s
  end
end

staircase 4
