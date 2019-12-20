require File.expand_path('../campaign.rb', __FILE__)
require File.expand_path('../adgroup.rb', __FILE__)
require File.expand_path('../config.rb', __FILE__)
require File.expand_path('../database.rb', __FILE__)
require File.expand_path('../campaigndata.rb', __FILE__)
require File.expand_path('../adgroupdata.rb', __FILE__)


class Handle
  attr_accessor :adwords, :type_file

  def initialize
    @adwords = nil
    campaign_selector
    @stats = {nb_ad_groups: 0, nb_campaigns: 0}
  end

  def setup_oauth2
    @adwords = AdwordsApi::Api.new

    verification_code = nil
    token = @adwords.authorize() do |auth_url|
      puts "Hit Auth error, please navigate to URL:\n\t%s" % auth_url
      print 'log in and type the verification code: '
      verification_code = gets.chomp
      verification_code
    end
    if verification_code && token
      puts 'Updating adwords_api.yml with OAuth credentials.'
      @adwords.save_oauth2_token(token)
      puts 'OAuth2 token is now saved and will be automatically used by the library.'
      puts 'Please restart the script now.'
      abort
    end
  end

  def launch
    camp = Campaigndata.new(@campaign_selector, @adwords)
    camp.fetch
    adgroup_setup
  end

  def display
    return unless Campaign.any?
    return if @stats[:nb_campaigns] == 0
    result = (@stats[:nb_ad_groups].to_f/@stats[:nb_campaigns].to_f).round

    puts ''
    puts "Mean number of AdGroups per Campaign: #{result}"
    puts ''
  end

  def display_one(adwords_id)
    campaign = Campaign.find_by(adwords_id: adwords_id)
    return unless campaign
    nb_adg = campaign.adgroups.count
    values = {
      id: campaign.adwords_id,
      name: campaign.name,
      status: campaign.status,
      nb_adg: nb_adg,
    }
    display_campaign values
    campaign.adgroups.each do |adgroup|
      display_adgroup(adgroup)
    end
  end

  private

  def adgroup_setup
    return unless Campaign.any?
    @stats[:nb_campaigns] = Campaign.count

    Campaign.limit(3).each do |campaign|
      selector = adgroup_selector(campaign.adwords_id)
      Adgroupdata.new(selector, @adwords).fetch(campaign.adwords_id)
      nb_adg = campaign.adgroups.count
      values = {
        id: campaign.adwords_id,
        name: campaign.name,
        status: campaign.status,
        nb_adg: nb_adg,
      }
      @stats[:nb_ad_groups] += nb_adg

      Display.new(type_file)
      Display.display_campaign values

      campaign.adgroups.each do |adgroup|
        display_adgroup(adgroup)
      end
    end
  end

  def display_campaign values
      puts "Campaign: %{id} \"%{name}\" [%{status}] AdGroups:%{nb_adg}" % values
  end

  def display_adgroup adgroup
      puts "Adgroup: %{id} \"%{name}\" [%{status}]" % { id: adgroup.adwords_id, name: adgroup.name, status: adgroup.status }
  end

  def campaign_selector
    @campaign_selector = {
      :fields => ['Id', 'Name', 'Status', 'ServingStatus', 'StartDate', 'EndDate', 'Settings'],
      :ordering => [
        {:field => 'Id', :sort_order => 'ASCENDING'}
      ],
      :paging => {
        :start_index => 0,
        :number_results => 500
      }
    }
  end

  def adgroup_selector(campaign_id)
    {
      :fields => ['Id', 'Name', 'CampaignId', 'Status', 'Settings'],
      :ordering => [{:field => 'Name', :sort_order => 'ASCENDING'}],
      :predicates => [
        {:field => 'CampaignId', :operator => 'IN', :values => [campaign_id]}
      ],
      :paging => {
        :start_index => 0,
        :number_results => 500
      }
    }
  end
end
