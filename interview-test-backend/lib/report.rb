require File.expand_path('../csv_handler.rb', __FILE__)

class Report

	attr_reader :data
    
    def initialize(file_path)
        @data = CSVHandler.get_data(file_path)
    end

    def output_report
        @data.each do |line|
            output_line(line)
        end
    end

    def send_sort_by_office
        data_sort = data_sort_by_office
        puts "Office Name: #{data_sort.map{|k, _| k}}"
        puts "Employee Count: #{data_sort.map{|_, v| v}}"
    end

    private

    def output_line(line)
        puts(line)
    end

    def data_sort_by_office
        office_data = @data.sort_by{|data| data['office']}
        office_arr = office_data.map{|data| data['office']}.uniq
        office = office_arr.each_with_object({}){|city, h| h[city] = 0} 
        office_data.each_with_object(office) do |data, hash|
            hash[data['office']] += 1
        end
    end
end
