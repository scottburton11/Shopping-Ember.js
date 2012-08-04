App.Product = Ember.Object.extend

  init: ->
    @_super()

  title: (-> 
    @get("designer_name") + ": " + @get("name")
    ).property("designer_name", "name")
