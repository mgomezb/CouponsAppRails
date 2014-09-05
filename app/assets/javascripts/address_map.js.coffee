# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  if handler and $('#local_address').length > 0 or true
    set_coords = (point)->
      # unless $('#local_address').val() is point.formatted_address
      #  $('#local_address').val(point.formatted_address)

      $('#local_latitude').val  point.geometry.location.lat()
      $('#local_longitude').val point.geometry.location.lng()

    # Gmaps.map.HandleDragend = (pos) ->
    #   geocoder = new google.maps.Geocoder()
    #   geocoder.geocode
    #     latLng: pos
    #   , (responses) ->
    #     # Gmaps.map.clear_circles()
    #     if responses and responses.length > 0
    #       point = responses[0]
    #       # Gmaps.map.create_circle
    #       #   lat: point.geometry.location.lat(),
    #       #   lng: point.geometry.location.lng(),
    #       #   radius: 25000,
    #       #   editable: true,
    #       #   draggable: true
    #       $('#local_address').val point.formatted_address
    #       set_coords point
    #     else
    #       $('#local_address').val null
    #       alert "No se pudo encontrar una dirección para esta ubicación."

    # Gmaps.map.HandleAreaDragend = (pos) ->
    #   geocoder = new google.maps.Geocoder()
    #   geocoder.geocode
    #     latLng: pos
    #   , (responses) ->
    #     # Gmaps.map.clear_circles()
    #     if responses and responses.length > 0
    #       point = responses[0]
    #     else
    #       alert "No se pudo encontrar una dirección para esta ubicación."

    # Gmaps.map.HandleCircleResize = (pos) ->
    #   geocoder = new google.maps.Geocoder()
    #   geocoder.geocode
    #     latLng: pos
    #   , (responses) ->
    #     # Gmaps.map.clear_circles()
    #     if responses and responses.length > 0
    #       point = responses[0]
    #       # Gmaps.map.create_circle
    #       #   lat: point.geometry.location.lat(),
    #       #   lng: point.geometry.location.lng(),
    #       #   radius: 25000,
    #       #   editable: true,
    #       #   draggable: true
    #       $('#local_address').val point.formatted_address
    #       set_coords point
    #     else
    #       $('#local_address').val null
    #       alert "No se pudo encontrar una dirección para esta ubicación."

    # Gmaps.map.callback = ->
    #   if Gmaps.map.markers[0]
    #     google.maps.event.addListener Gmaps.map.markers[0].serviceObject, "dragend", ->
    #       Gmaps.map.HandleDragend @getPosition()
    #   if Gmaps.map.circles[0]
    #     google.maps.event.addListener Gmaps.map.circles[0].serviceObject, "dragend", ->
    #       console.log @getPosition()
    #     google.maps.event.addListener Gmaps.map.circles[0].serviceObject, "radius_changed", ->
    #       console.log @getRadius()

    # address = $('#local_address').val()

    window.filter_address = ->

      address = $('#local_address').val()

      return false if address.length < 4

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

            handler.removeMarkers(window.markers) if window.markers[0];

            window.markers = handler.addMarker({lat: point.geometry.location.lat(), lng: point.geometry.location.lng()});
            handler.getMap().setCenter point.geometry.location
            handler.getMap().setZoom(14)
            #handler.bounds.extendWith(markers);

    $('#local_address').on 'keyup', filter_address

    $('#local_address').on 'change', filter_address
