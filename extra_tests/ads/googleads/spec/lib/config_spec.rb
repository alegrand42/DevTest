require "rails/all"
require "sqlite3"
require_relative '../../lib/database.rb'
require_relative '../../lib/config.rb'

RSpec.describe Config, type: :model do
  context 'validations' do
    subject { Config.create(name: 'test',
                              record_id: "123",
                              record_type: "OK",
                              data: "more data"
                             ) }

    it 'has data' do
      expect(subject.name).not_to be_empty
    end
  end
end
