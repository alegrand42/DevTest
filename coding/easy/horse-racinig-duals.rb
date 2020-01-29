# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
strength = []
n.times do
    pi = gets.to_i
    strength << pi
end

res = []
strength.sort.each_with_index do |s, i|
    res << (strength[i + 1] - s).abs if strength[i + 1]
end

#STDERR.puts res.select{|e| e if e < 300}

puts res.min