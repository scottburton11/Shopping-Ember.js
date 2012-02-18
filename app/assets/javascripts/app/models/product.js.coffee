App.Product = Ember.Object.extend

  init: ->
    @_super()
    @set "inCart", false

  addToCart: ->
    @set "inCart", true
  
  removeFromCart: ->
    @set "inCart", false