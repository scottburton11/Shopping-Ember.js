//= require_tree ./lib

//= require app/app

//= require app/history

//= require_tree ./app/templates

//= require_tree ./app/models
//= require_tree ./app/controllers
//= require_tree ./app/views

$ ->

  App.cart = App.CartController.create()

  App.main = App.MainController.create
    cart: App.cart

  App.manager = Ember.StateManager.create
    rootElement: "#main"

    indexView: Ember.ViewState.create
      view: App.main.index
      initialState: true

    showView: Ember.ViewState.create
      view: App.main.detail

    show: (params) ->
      item = App.main.itemsController.find (item) ->
        item.get("id") is parseInt(params.id)
      App.main.detailController.set("content", item)
      App.manager.goToState("showView")

    index: ->
      App.manager.goToState("indexView")
      App.main.index.rebindWaypoint()

    men: ->
      App.main.itemsController.set("category", "MEN")
      App.main.itemsController.getItems()
      App.manager.index()

    women: ->
      App.main.itemsController.set("category", "WOMEN")
      App.main.itemsController.getItems()
      App.manager.index()

  App.router.routes
    "/"                       : App.manager.index
    "/men"                    : App.manager.men
    "/women"                  : App.manager.women
    "/products/:id"           : App.manager.show


  App.main.render()

  App.manager.index()