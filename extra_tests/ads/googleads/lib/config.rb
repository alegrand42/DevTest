class Config < ActiveRecord::Base
  self.table_name = "confs"

  belongs_to :record, polymorphic: true
end
