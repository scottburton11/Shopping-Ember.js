App.router = Ember.Object.create 
  navigate: (params, title, href) ->
    History.pushState params, title, href

App.routes =
  "/" : ""

$ ->
  $(window).bind "statechange", ->
    console.log "State changed: ", History.getState()


  $(document).on "click", "a.navigable", (e) ->
    e.preventDefault()
    App.router.navigate({id: $(e.currentTarget).attr("data-id")}, $(e.currentTarget).attr("data-title"), $(e.currentTarget).attr("href"))