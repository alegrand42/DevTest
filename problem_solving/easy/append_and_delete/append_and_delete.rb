#!/usr/bin/ruby

=begin
s1 = hackerhappy
s2 = hackerrank
n = 9
=> Yes

ashley
ash
2
=> No
=end

def append_and_delete(s1, s2, n)
  l1 = s1.length
  l2 = s2.length
  a1 = s1.split('')
  a2 = s2.split('')

  a1.each_with_index do |a, i|
    if a != a2[i]
      l1 = a1.length - i
      l2 = a2.length - i
      break
    end
  end
  l1 + l2 <= n ? 'Yes' : 'No'
end

s1 = 'hackerhappy'
s2 = 'hackerrank'
n = 9
p append_and_delete(s1, s2, n)
s1 = 'ashley'
s2 = 'ash'
n = 2
p append_and_delete(s1, s2, n)
