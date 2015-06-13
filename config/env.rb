ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup'

Bundler.require(:default)

require "cuba"
require "cuba/safe"
require "active_record"
require "active_model"
require_relative "./../app/hello_world"


ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "./db/foobar.db"
)

unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Schema.define do
    create_table :users do |table|
      table.column :first, :string
      table.column :last, :string
      table.column :org_id, :integer
    end
  end
end


unless ActiveRecord::Base.connection.table_exists?(:orgs)
  ActiveRecord::Schema.define do
    create_table :orgs do |table|
      table.column :name, :string
    end
  end
end

