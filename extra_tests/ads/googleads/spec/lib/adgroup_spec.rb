require "rails/all"
require "sqlite3"
require_relative '../../lib/database.rb'
require_relative '../../lib/adgroup.rb'

RSpec.describe Adgroup, type: :model do
  context 'validations' do
    subject { Adgroup.create(name: 'test',
                              adwords_id: "123",
                              status: "OK",
                              campaign_id: "12"
                             ) }

    it 'has data' do
      expect(subject.name).not_to be_empty
    end
  end
end
