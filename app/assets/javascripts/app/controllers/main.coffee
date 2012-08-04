App.MainController = Ember.Object.extend

  init: -> 
    @_super()
    @itemsController = App.ItemsController.create(store: "men")

    @index = App.IndexView.create
      list: @itemsController
      titleBinding: "list.storeTitle"  

    @detailController = App.ProductController.create
      content: null
      cart: @cart

    @detail = App.DetailView.create
      contentController: @detailController
      # inCartBinding: "contentController.inCart"
      storeBinding: "@itemsController.store"


  render: ->
    @get("itemsController").getItems()






  # App.itemsController = App.ItemsController.create
  #   store: "MEN"

  # App.index = 


  
  # App.detailController = App.ProductController.create
  #   content: null
  #   cart: App.cart

  # App.detail = App.DetailView.create
  #   inCartBinding: "App.detailController.inCart"
  #   contentController: App.detailController
  #   storeBinding: "App.itemsController.store"