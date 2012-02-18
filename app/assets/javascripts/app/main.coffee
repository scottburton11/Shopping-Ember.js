$ ->

  $(window).bind "statechange", ->
    console.log History.getState()
    
  $("body a.navigable").on "click", (e) ->
    console.log $(e.currentTarget).attr("href")
    History.pushState($(e.currentTarget).attr("href"))
    e.preventDefault()
    

  App.itemsController = App.ItemsController.create
    category: "MEN"

  App.index = App.IndexView.create
    title: "Men"
    list: App.itemsController
    active: true
  

  # App.index.appendTo("#main")

  App.itemsController.getItems()
  
  App.detailController = App.ProductController.create
    content: null

  App.detail = App.DetailView.create
    active: false
    
  # App.detail.addObserver "content", ->
  #   if App.detail.get "content"
  #     App.index.set "active", false
  #     App.detail.set "active", true

  # App.detail.appendTo("#main")

  App.main = Ember.StateManager.create
    rootElement: "#main"

    indexView: Ember.ViewState.create
      view: App.index

    showView: Ember.ViewState.create
      view: App.detail

    show: (content) ->
      App.detail.set("content", content)
      @goToState("showView")

    index: ->
      @goToState("indexView")
      App.index.rebindWaypoint()


  App.main.index()