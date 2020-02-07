# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

def fac(n)
    (1..n).inject(:*) || 1
end

r = gets.to_i
v = gets.to_i
c, n = 0, 0
v.times do
    c, n = gets.split(" ").collect {|x| x.to_i}
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

STDERR.puts "c: #{c} n: #{n}"

vault = v
nb = fac(10) / (fac(n) * fac(10 - n))
lt = fac(15) / (fac(c - n) * fac(15 - c + n))
time = nb * lt
STDERR.puts "nb: #{nb} lt: #{lt}"

while vault > 0 do
    vault -= r
    #time += 10**(n) * 5**(c - n)
    time += (lt * nb)
    STDERR.puts "v: #{v} rob: #{r} || time: #{time} vault: #{vault}"
end


puts time
