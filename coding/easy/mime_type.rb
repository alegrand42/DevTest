# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i # Number of elements which make up the association table.
q = gets.to_i # Number Q of file names to be analyzed.


mime = []
extension = []

n.times do
    # ext: file extension
    # mt: MIME type.
    ext, mt = gets.split(" ")
    #STDERR.puts "ext: #{ext} mt: #{mt}"
    
    extension << ext.downcase
    mime << mt #.downcase
end

#STDERR.puts "ext: #{extension}"
#STDERR.puts "mime: #{mime}"

q.times do
    fname = gets.chomp # One file name per line.
    
    str = ""
    file_ext = fname.split(".").last
    file_ext = file_ext.downcase unless file_ext.nil?
    #STDERR.puts "#{fname} : #{file_ext}"
    if extension.any? file_ext
        #str = "UNKNOWN" if fname.include? ".."
        #str = "UNKNOWN" if fname[0] == "."
        str = "UNKNOWN" unless fname.include? "."
        str = "UNKNOWN" if fname[-1] == "."
        i = extension.index(file_ext)
        str = mime[i] if str == ""
    else
        str = "UNKNOWN"
    end
    puts str
end