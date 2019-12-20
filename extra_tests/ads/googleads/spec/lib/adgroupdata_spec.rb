require_relative '../../lib/adgroupdata.rb'

RSpec.describe Adgroupdata do
  describe '#initialize' do
    it 'instanciates variables' do
      selector = {test: '123'} 
      base = Adgroupdata.new(selector, nil)
      expect(base.selector).to eq(selector)
      expect(base.adwords).to eq(nil)
    end
  end

  describe '#fetch' do
    let(:campaign_id) { 1 }
    it 'reads page to fill data' do
      selector = {test: '123'}
      base = Adgroupdata.new(selector, nil)
      expect(base.fetch(campaign_id)).to eq(nil)
    end
  end
end
