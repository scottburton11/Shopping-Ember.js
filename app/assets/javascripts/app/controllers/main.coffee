App.MainController = Ember.Object.extend

  init: -> 
    @_super()
    @itemsController = App.ItemsController.create(category: "MEN")

    @index = App.IndexView.create
      list: @itemsController
      titleBinding: "list.categoryTitle"  

    @detailController = App.ProductController.create
      content: null
      cart: @cart

    @detail = App.DetailView.create
      contentController: @detailController
      # inCartBinding: "contentController.inCart"
      categoryBinding: "@itemsController.category"


  render: ->
    @get("itemsController").getItems()






  # App.itemsController = App.ItemsController.create
  #   category: "MEN"

  # App.index = 


  
  # App.detailController = App.ProductController.create
  #   content: null
  #   cart: App.cart

  # App.detail = App.DetailView.create
  #   inCartBinding: "App.detailController.inCart"
  #   contentController: App.detailController
  #   categoryBinding: "App.itemsController.category"