App.ItemView = Ember.View.extend
  templateName: "item"
  className: ["product"]

  didInsertElement: ->
    $.waypoints("refresh")

  click: (e) ->
    content = @get("content")
    App.router.navigate ("/products/" + content.id), 
      content.get("title"), 
      name: content.get("name"), 
      designer_name: content.get("designer_name"), 
      id: content.get("id")  
    e.preventDefault()