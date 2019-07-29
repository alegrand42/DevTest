require 'csv'

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
