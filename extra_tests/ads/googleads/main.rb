require 'adwords_api'
require "rails/all"
require "sqlite3"
require "pry"

require File.expand_path('../lib/handle.rb', __FILE__)

return unless  __FILE__ == $PROGRAM_NAME

handle = Handle.new
handle.setup_oauth2
handle.launch
handle.display

return unless Campaign.all.any?
return unless ARGV

puts "============"
puts "display the corresponding campaign/adgroup settings when I pass an adwords_id"
ARGV.each do |adwords_id|
  handle.display_one(adwords_id)
end
