class DropLocationSearchesTable < ActiveRecord::Migration
  def up
    drop_table :location_searches
  end

  def down
    create_table :location_searches do |t|
      t.string :new
      t.timestamps
    end
  end
end
