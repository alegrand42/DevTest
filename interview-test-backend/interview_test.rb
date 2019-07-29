#!/usr/bin/ruby

require File.expand_path('../lib/text_report.rb', __FILE__)

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

if __FILE__ == $PROGRAM_NAME
    filename = './csv/interview_test.csv'
    if File.file?(filename)
        reportText = TextReport.new(filename)
        puts '## 1. Code refactoring'
        reportText.output_report
        puts '## 2. Data manipulation'
        reportText.send_sort_by_office
    end
end
