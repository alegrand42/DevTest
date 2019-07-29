#!/usr/bin/ruby

require 'csv'

#### ORIG #####

=begin
def parser(lines)
  lines.each do |line|
    name, employee_id, office = line.split(',')
    puts "employee_id: #{employee_id}"
    puts "office: #{office}"

    last_name, first_name = name.split
    puts "last_name: #{last_name}"
    puts "first_name: #{first_name}"
  end
end

raw_lines = File.new('interview_users.csv').readlines

parser(raw_lines)
=end

#### - #####

module CSVHandler

    def self.get_data(file_path='./interview_test.csv')
        begin
            csv = CSV::parse(File.open(file_path, 'r') {|f| f.read })
            fields = %w{last_name id office}
            res = csv.collect { |record| Hash[*fields.zip(record).flatten ] }
            raise "ERROR: no data" if res.empty?
            split_name(res)
            clean_office(res)
        rescue CSV::MalformedCSVError => e
            raise "ERROR: malformed csv"
        end
    end

    private

    def self.clean_office(arr)
        arr.map{|h| h['office'] = h['office'].strip; h}
    end

	def self.split_name(arr)
		arr.map do |hash|
            names = hash['last_name'].split(' ')
            raise "ERROR: incorrect name" unless names.length == 2
            hash_name = {
                'last_name' => names[1],
                'first_name' => names[0]
            }
            hash['last_name'] = hash_name['last_name']
            hash.merge!(hash_name)
        end
	end
end

class Report
    
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

class Textreport < Report
    
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

if __FILE__ == $PROGRAM_NAME
    filename = './interview_test.csv'
    if File.file?(filename)
        reportText = Textreport.new(filename)
        puts '## 1. Code refactoring'
        reportText.output_report
        puts '## 2. Data manipulation'
        reportText.send_sort_by_office
    end
end
