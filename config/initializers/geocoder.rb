# config/initializers/geocoder.rb
Geocoder.configure(
    # geocoding service
    lookup: :google,

    # geocoding service request timeout (in seconds)
    timeout: 15,

    # default units
    units: :mi
)