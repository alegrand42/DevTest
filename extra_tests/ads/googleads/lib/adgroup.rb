class Adgroup < ActiveRecord::Base
  validates :adwords_id, uniqueness: true, presence: true
  belongs_to :campaign

  has_one :conf, class_name: "Config", as: :record
end
