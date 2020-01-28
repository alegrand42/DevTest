# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

message = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."


arr = []

message.split("").each do |ch|
    un = ch.unpack("B*").first.split("")
    un.delete_at(0) if un[0] == "0"
    arr += un
end

i = 0
diff = arr[0]
str = ""

STDERR.puts arr.to_s

begin
    count = 0
    while arr[i] == diff
        i+=1
        count += 1 
    end
    
    str += diff.to_i < 1 ? "00 " : "0 "
    count.times{|c| str += "0"}
    STDERR.puts "i:#{i} count: #{count} diff :#{diff}"
    diff = diff.to_i > 0 ? "0" : "1"
    
    str += " " if count > 0 && i <= arr.length - 1
    
    
    i += 1 if count == 0
    
end  while i < arr.length

puts str