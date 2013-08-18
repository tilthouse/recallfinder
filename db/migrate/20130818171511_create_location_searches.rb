class CreateLocationSearches < ActiveRecord::Migration
  def change
    create_table :location_searches do |t|
      t.string :new

      t.timestamps
    end
  end
end
