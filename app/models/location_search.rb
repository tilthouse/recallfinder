class LocationSearch
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :address1, :address2, :city, :state, :zip

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def find_by_address(address)
    find_by_coordinates(coordinates)
  end

  def find_by_coordinates(coords)
    SignatureCollectionLocation.near(coords, 10)
  end

  def address
    full_address = address1
    full_address += " #{address2}" if address2.present?
    full_address += " #{city},"
    full_address += " #{state}"
    full_address += " #{zip}"
    full_address
  end

  def coordinates
    @coords ||= Geocoder.coordinates(address)
  end
end
