class Campaign < ActiveRecord::Base
  validates :adwords_id, uniqueness: true, presence: true
  has_one :conf, class_name: "Config", as: :record

  has_many :adgroups
end
