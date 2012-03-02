App.ProductController = Ember.Object.extend
  content: null

  addToCart: ->
    if @canAdd()
      @cart.addObject(@get("content"))

  canAdd: -> 
    @get("content") and !@inCart

  inCart: (-> @cart.contains(@get("content"))).property()