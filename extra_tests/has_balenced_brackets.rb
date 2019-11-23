#!/usr/bin/ruby

def isBalenced? str
  return false if str.length.odd?
  return false if str =~ /[^\{\}\(\)\[\]]/

  brackets = {"[" => "]","{" => "}","(" => ")"}

  stack = []
  str.chars.each do |c|
    if expectation = brackets[c]
      stack << expectation
    else
      return false unless stack.pop == c
    end
  end
  stack.empty?
end

def isBalencedBracket? str
  if isBalenced? str
    str += " has balenced brackets"
  else
    str += " hasn't balenced brackets"
  end
  puts str
end

## Test ##

test ="{[(a)[]]}" 
isBalencedBracket? test
p "-------------------------"
test ="{[(a)[]b]}" 
isBalencedBracket? test
p "-------------------------"
test ="{[()]}" 
isBalencedBracket? test
p "-------------------------"
test = "{(([])[])[]}[]"
isBalencedBracket? test
