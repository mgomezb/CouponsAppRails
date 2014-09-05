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


##################################################################################################

    # handler.HandleDragend = (pos) ->
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

    # window.handler.callback = ->
    #   if window.marker
    #     google.maps.event.addListener window.markers.serviceObject, "dragend", ->
    #       handler.HandleDragend @getPosition()

##########################################################################################################
    window.filter_address = ->

      address = $('#local_address').val()

      #return false if address.length < 4

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

            handler.removeMarker(window.marker) if window.marker;

            window.marker = handler.addMarker({lat: point.geometry.location.lat(), lng: point.geometry.location.lng()});

            handler.getMap().setCenter point.geometry.location
            handler.getMap().setZoom(16)
            #handler.callback();

    $('#local_address').on 'keyup', filter_address

    $('#local_address').on 'change', filter_address
