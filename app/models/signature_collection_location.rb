class SignatureCollectionLocation < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :latitude, :longitude, :name, :notes, :state, :zip

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def address
    full_address = address1
    full_address += " #{address2}" if address2.present?
    full_address += " #{city},"
    full_address += " #{state}"
    full_address += " #{zip}"
  end


  def address_changed?
    address1_changed? or address2_changed? or city_changed? or state_changed? or zip_changed?
  end
end
