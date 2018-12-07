#!/usr/bin/ruby

require 'csv'

module CSVHandler

    def self.get_data(file_path='./input.csv')
        begin
            csv = CSV::parse(File.open(file_path, 'r') {|f| f.read })
            fields = csv.shift
            fields = fields.map {|f| f.downcase}
            raise "ERROR: wrong csv argument" if ! required_fields(fields, ["revenue", "impressions", "website"])
            res = csv.collect { |record| Hash[*fields.zip(record).flatten ] }
            raise "ERROR: no data" if res.empty?
            res
        rescue CSV::MalformedCSVError => e
            raise "ERROR: malformed csv"
        end
    end

    def self.required_fields(fields, required=[])
      raise( "ERROR: required_fields validation needs an array argument" ) unless required.is_a?(Array)
      fields.sort == required.sort
    end

end

module DataHandler

    def self.get_stats(data, cpm)
        {
            "The website with the highest revenue is" => get_max_website(data, "revenue"),
            "The website with the highest impressions is" => get_max_website(data, "impressions"),
            "The website with the highest cpm is" => cpm.max_by{|k, v| v}[0] 
        }
    end

    def self.get_max_website(data, key)
        data.each_with_object(Hash.new(-1)){|d, h| h[d['website']] = d[key].to_f}.max_by{|k, v| v}[0]
    end

    def self.get_cpm(data)
        data.each_with_object(Hash.new(-1)){|d, h| h[d['website']] = d['impressions'].to_i > 0 ? (d['revenue'].to_f / d['impressions'].to_f * 1000).round(2) : -1}
    end

end


class Report
    
    def initialize(file_path)
        @title = 'Monthly Report'
        @data = CSVHandler.get_data(file_path)
        @cpm = DataHandler.get_cpm(@data)
        @stats = DataHandler.get_stats(@data, @cpm)
    end

    def output_report
        output_head
        output_body
    end

    def output_body
        @text.each do |line|
            output_line(line)
        end
    end

    def output_line(line)
        puts(line)
    end

    def output_head
        raise 'Called abstract method: output_head'
    end
end

class PlainTextReport < Report
    
    def initialize(file_path)
        super
        @title = "##############\n# PLAIN TEXT #\n##############\n"
    end

    def output_body
        display_head("Winners")
        display_results(@stats)
        display_head("cpm")
        display_cpm(@cpm)
    end

    def output_head
        puts @title
    end

    def display_head str
        puts("**** #{str} ****")
    end

    def display_results stats
        stats.each{|k, v| puts "#{k}: #{v}"}
    end

    def display_cpm cpm
        cpm.each{|k, v| puts "- #{k}: #{v}"}
    end

end

class HTMLReport < Report

    def initialize(file_path)
        super
        @title = "########\n# HTML #\n########\n"
    end

    def output_head
        puts @title
    end

    def output_body
        puts html_h1("Winners")
        puts html_ul(@stats)
        puts html_h1("cpm")
        puts html_ul(@cpm)
    end

    def html_h1 str
        "<h1>" << str << "</h1>\n"
    end

    def wrap_in_li str
        " <li>" << str << "</li>\n"
    end

    def html_ul(hash)
        output = "<ul>\n"
        hash.each{|k, v| output << wrap_in_li("#{k}: #{v}")}
        output << "</ul>\n"
    end
end

if __FILE__ == $PROGRAM_NAME

    filename = './input.csv'
    if File.file?(filename)
        reportText = PlainTextReport.new(filename)
        reportText.output_report
        reportHTML = HTMLReport.new(filename)
        reportHTML.output_report
    end

end
