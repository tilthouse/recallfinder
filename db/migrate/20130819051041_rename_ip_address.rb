class RenameIpAddress < ActiveRecord::Migration
  def change
    rename_column :signature_collection_locations, :ip_address, :created_by_ip_address
  end
end
