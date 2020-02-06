# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r_1 = gets.to_i
r_2 = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

def get_next(n_str)
    sum = n_str.to_s.split('').map(&:to_i).reduce(:+)
    sum + n_str
end

r1 = [r_1]
r2 = [r_2]
100_000.times do
    r1 << get_next(r1.last)
    r2 << get_next(r2.last)
    res = r2 & r1
    if res.length > 0
        puts res
        exit
    end
end
