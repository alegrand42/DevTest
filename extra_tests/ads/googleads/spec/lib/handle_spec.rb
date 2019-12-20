require_relative '../../lib/handle.rb'

RSpec.describe Handle do
  describe '#initialize' do
    it 'instanciates variables' do
      handle = Handle.new
      expect(handle.adwords).to eq(nil)
    end
  end

  describe '#display' do
    it 'returns when there is no campaign' do
      handle = Handle.new
      expect(handle.display).to eq(nil)
    end
  end

  describe '#display_one' do
    it 'returns when there is no campaign' do
      handle = Handle.new
      expect(handle.display_one(12)).to eq(nil)
    end
  end
end
