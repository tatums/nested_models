ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/dbfile.sqlite3')

class AddSystemSettings < ActiveRecord::Migration
  def up
    create_table :system_settings do |t|
      t.string  :name
      t.string  :label
      t.text    :value
      t.string  :type
      t.integer :position
    end

    SystemSetting.create name: 'notice', label: 'Use notice?', value: 1
  end

  def down
    drop_table :system_settings
  end
end
