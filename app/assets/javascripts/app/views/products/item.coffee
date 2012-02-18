App.ItemView = Ember.View.extend
  templateName: "item"
  className: ["product"]

  didInsertElement: ->
    # console.log "Child: didInsertElement"
    $.waypoints("refresh")

  click: (e) ->
    App.main.show @get("content")
    e.preventDefault()
    