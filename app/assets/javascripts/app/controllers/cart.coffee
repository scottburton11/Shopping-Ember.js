App.CartController = Ember.ArrayController.extend
  init: ->
    @_super()
    @set("content", [])

  itemsInCart: (-> @get("content").length ).property("content")