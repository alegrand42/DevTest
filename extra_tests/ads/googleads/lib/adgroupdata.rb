require File.expand_path('../base.rb', __FILE__)

class Adgroupdata < Base

  private

  def fill_data(data, campaign_id)
    Adgroup.new do |ag|
      ag.adwords_id = data[:id]
      ag.campaign = Campaign.find_by(adwords_id: campaign_id)
      ag.name = data[:name]
      ag.status = data[:status]
      ag.create_conf(data: JSON.dump(data[:settings])) if ag.save
    end
  end

  def srv
    return unless @adwords
    @srv = @adwords.service(:AdGroupService, API_VERSION)
  end
end
