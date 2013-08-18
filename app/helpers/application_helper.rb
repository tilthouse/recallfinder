module ApplicationHelper
  def google_maps_api_key
    ENV['GOOGLE_MAPS_API_KEY']
  end

  def google_maps_script_src
    if google_maps_api_key.present?
      "http://maps.googleapis.com/maps/api/js?key=#{google_maps_api_key}&sensor=false"
    else
      "http://maps.googleapis.com/maps/api/js?sensor=false"
    end
  end
end
