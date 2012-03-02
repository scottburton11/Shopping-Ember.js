App.IndexView = Ember.View.extend
  templateName: "index"
  classNames: ["index"]

  didInsertElement: ->
    @setupWaypoint()

  logWaypoint: ->
    $.each $.waypoints(), (index, waypoint)->
      console.log $(waypoint).offset().top

  setupWaypoint: ->
    if @list.page < @list.total_pages then @rebindWaypoint() else @unbindWaypoint()

  rebindWaypoint: ->
    if $.waypoints().length is 0
      @bindWaypoint()
    else
      $.waypoints("refresh")

  unbindWaypoint: ->
    $(".waypoint").waypoint('destroy')

  bindWaypoint: ->
    $(".waypoint").waypoint
      handler: (event, direction) =>
        @waypointReached(event, direction)
      offset: "100%"
      onlyOnScroll: true

  waypointReached: (event, direction) ->
    @list.getItems()