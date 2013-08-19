class AddMoreToLocationSignatureCollectionLocations < ActiveRecord::Migration
  def change
    add_column :signature_collection_locations, :phone, :string
    add_column :signature_collection_locations, :venue_name, :string
    add_column :signature_collection_locations, :venue_type, :integer
    add_column :signature_collection_locations, :ready, :boolean, null: false, default: false
    add_column :signature_collection_locations, :active, :boolean, null: false, default: false
    add_column :signature_collection_locations, :ip_address, :string
  end
end
