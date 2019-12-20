require "rails/all"
require "sqlite3"
require_relative '../../lib/database.rb'
require_relative '../../lib/campaign.rb'

RSpec.describe Campaign, type: :model do
  context 'validations' do
    subject { Campaign.create(name: 'test',
                              adwords_id: "123",
                              status: "OK",
                              serving_status: "OK"
                             ) }

    it 'has data' do
      expect(subject.name).not_to be_empty
    end
  end
end
