class CreateSignatureCollectionLocations < ActiveRecord::Migration
  def change
    create_table :signature_collection_locations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.text :notes
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
