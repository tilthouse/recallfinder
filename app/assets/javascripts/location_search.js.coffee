# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  console.log gon.signature_collection_locations
  console.log gon.search_location

  centerLatLng = new google.maps.LatLng(gon.search_location.coords[0], gon.search_location.coords[1])
  mapOptions =
    center: centerLatLng
    zoom: 8
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  center_marker = new google.maps.Marker(
    position: centerLatLng
    map: map
    title: "Your search location",
    info: new google.maps.InfoWindow({
      content: 'Your search location'
    })
  )
  google.maps.event.addListener center_marker, 'click', ->
    center_marker.info.open(map, center_marker)
  console.log center_marker
  markers = gon.signature_collection_locations.map (location) ->
    marker = new google.maps.Marker(
      position: new google.maps.LatLng(location.latitude, location.longitude),
      map: map
      title: location.name,
      info: new google.maps.InfoWindow({
        content: location.name
      })
    )
    google.maps.event.addListener marker, 'click', ->
      marker.info.open(map, marker)

  console.log markers
  bounds = new google.maps.LatLngBounds()
  for marker in markers
    do ->
      bounds.extend(marker.position)
  map.setCenter(bounds.getCenter())
  map.fitBounds(bounds)