class Base

  API_VERSION = :v201809
  attr_accessor :selector, :adwords 
  attr_reader :srv

  def initialize(selector, adwords)
    @selector = selector
    @adwords = adwords
    @srv = nil
  end

  def fetch(campaign_id = nil)
    srv
    offset, page = 0, {}

    return unless @srv
    begin
      page = @srv.get(@selector)
      if page[:entries]
        page[:entries].each do |data|
          fill_data(data, campaign_id)
        end
        offset += 500
        @selector[:paging][:start_index] = offset
      end
    end while page[:total_num_entries] > offset
  end

  private

  def fill_data(data, campaign_id)
    #instantiate and fill any model
  end

  def srv
  end
end
