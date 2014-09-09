# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.handler = undefined
window.marker = undefined
window.circle = undefined

show = ->
  infoLat = $('#info').data('latitude')
  infoLng = $('#info').data('longitude')
  infoRadius = $('#info').data('radius')

  if handler and infoLat and infoLng
    handler.addMarker({lat: infoLat, lng: infoLng})
    handler.addCircle({lng: infoLng, lat: infoLat, radius: infoRadius})
    handler.getMap().setCenter({lat: infoLat, lng: infoLng})
    handler.getMap().setZoom(16)

newLocal = ->
  if handler and $('#local_address').length > 0 or true
    set_coords = (point)->
      # unless $('#local_address').val() is point.formatted_address
      #  $('#local_address').val(point.formatted_address)

      $('#local_latitude').val  point.geometry.location.lat()
      $('#local_longitude').val point.geometry.location.lng()

    window.filter_address = ->

      address = $('#local_address').val()

      geocoder = new google.maps.Geocoder()
      geocoder.geocode
       address: address,
      , (responses) ->
        if responses and responses.length > 0
          point = responses[0]
          if point
            unless $('#local_address').is(':focus')
              $('#local_address').val point.formatted_address
            set_coords point

            handler.removeMarker(window.marker) if window.marker

            window.marker = handler.addMarker({lat: point.geometry.location.lat(), lng: point.geometry.location.lng()})
            handler.getMap().setCenter point.geometry.location
            handler.getMap().setZoom(16)

    $('#local_address').on 'keyup', filter_address

    $('#local_address').on 'change', filter_address

$ ->

  window.handler = Gmaps.build('Google')
  window.handler.buildMap({ provider: {}, internal: {id: 'map'}}, ->
    handler.getMap().setZoom(6)
    if window.location.href.match(/locals\/[1-9]*[0-9]+/)
      show()
    if window.location.href.match(/locals\/new/)
      handler.getMap().setCenter(new google.maps.LatLng(-33.437583, -70.650505))
      newLocal()
    if window.location.href.match(/locals\/*/)
      show()
      newLocal()
  )
