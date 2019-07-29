require File.expand_path('../report.rb', __FILE__)

class TextReport < Report
    
    def initialize(file_path)
        super
    end

    private

    def output_line(line)
        puts "--->"
        puts "Employee Id: #{line['id']}"
        puts "Office: #{line['office']}"
        puts "Last Name: #{line['last_name']}"
        puts "First Name: #{line['first_name']}"
    end
end
