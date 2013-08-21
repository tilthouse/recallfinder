class SignatureCollectionLocation < ActiveRecord::Base
  VENUE_TYPES = %w( 'One Time' 'Regularly' )

  attr_accessible :name, :phone, :venue_name, :address1, :address2, :city, :state, :zip, :notes,
                  :venue_type,
                  :ready, :active, :latitude, :longitude, :created_by_ip_address


  validates_presence_of :name, :venue_name, :address1, :city, :state, :phone
  validates_inclusion_of :venue_type, :in => VENUE_TYPES

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  scope :displayable, -> { where(active: true, ready: true) }

  def address
    full_address = address1
    full_address += " #{address2}" if address2.present?
    full_address += " #{city},"
    full_address += " #{state}"
    full_address += " #{zip}"
    full_address
  end


  def address_changed?
    address1_changed? or address2_changed? or city_changed? or state_changed? or zip_changed?
  end
end
