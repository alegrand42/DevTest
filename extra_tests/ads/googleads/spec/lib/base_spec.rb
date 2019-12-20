require_relative '../../lib/base.rb'

RSpec.describe Base do
  describe '#initialize' do
    it 'instanciates variables' do
      selector = {test: '123'} 
      base = Base.new(selector, nil)
      expect(base.selector).to eq(selector)
      expect(base.adwords).to eq(nil)
    end
  end

  describe '#fetch' do
    it 'returns when there is no srv variable' do
      selector = {test: '123'}
      base = Base.new(selector, nil)
      expect(base.fetch).to eq(nil)
    end
  end
end
