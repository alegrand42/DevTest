require File.expand_path('../base.rb', __FILE__)

class Campaigndata < Base

  private

  def fill_data(data, campaign_id)
    Campaign.new do |cp|
      cp.adwords_id = data[:id]
      cp.name = data[:name]
      cp.status = data[:status]
      cp.serving_status = data[:serving_status]
      cp.start_date = data[:start_date]
      cp.end_date = data[:end_date]
      cp.create_conf(data: JSON.dump(data[:settings])) if cp.save
    end
  end

  def srv
    return unless @adwords
    @srv = @adwords.service(:CampaignService, API_VERSION)
  end
end
