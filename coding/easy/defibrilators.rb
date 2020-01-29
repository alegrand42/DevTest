# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

def calc_distance(lon, lat, ln, lt)
    x = (ln - lon) * Math.cos((lat + lt) / 2)
    y = (lt - lat)
    Math.sqrt(x * x + y * y) * 6371
end

lon = gets.chomp
lat = gets.chomp
n = gets.to_i

distances = {}
n.times do
    defib = gets.chomp
    
    arr = defib.split(";")
    lt = arr.last.gsub(",", ".").to_f
    ln = arr[4].gsub(",", ".").to_f
    lat = lat.to_s.gsub(",", ".").to_f
    lon = lon.to_s.gsub(",", ".").to_f
    
    distance = calc_distance(lon, lat, ln, lt)
    #STDERR.puts "lat: #{lat} lon: #{lon} dst: #{distance}"
    distances[distance] = arr[1]
end

puts distances.sort_by{|k, _| k}.first[1]

