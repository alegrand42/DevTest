ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  encoding: "unicode",
  database: "reports",
  username: "postgres",
  password: "xxx"
)

#ActiveRecord::Base.establish_connection(
#  adapter: "sqlite3",
#  database: "reports"
#)

ActiveRecord::Schema.define do
  self.verbose = false

  create_table(:confs) do |t|
    t.text :name
    t.integer :record_id
    t.text :record_type
    t.text :data
    t.datetime :created_at
    t.datetime :updated_at
  end unless table_exists?(:confs)

  create_table(:campaigns) do |t|
    t.text :adwords_id
    t.text :name
    t.text :status
    t.text :serving_status
    t.datetime :start_date
    t.datetime :end_date
    t.datetime :created_at
    t.datetime :updated_at
  end unless table_exists?(:campaigns)

  create_table(:adgroups) do |t|
    t.text :campaign_id
    t.text :adwords_id
    t.text :name
    t.text :status
    t.datetime :created_at
    t.datetime :updated_at
  end unless table_exists?(:adgroups)
end
