App.router = Ember.Object.create
  routeList: []
  nameMatch: /:[\w\d]+/g
  nameReplacement: "([\\w\\d]+)"

  routes: (obj) ->
    App.router.add(key, value) for key, value of obj

  add: (path, callback) ->
    names = []
  
    if App.router.nameMatch.test(path)
      for name in path.match(App.router.nameMatch)
        names.push name.match(/[\w\d]+/)
        path = path.replace(App.router.nameMatch, App.router.nameReplacement, "g")

    routeObj = 
      path:  new RegExp("^#{path}$")
      names: names
      callback: callback


    App.router.routeList.push routeObj

  navigate: (path, title = null, params = {}) ->
    params["path"] ||= path
    History.pushState params, title, path

  dispatch: (hash) ->
    if route = @match(hash)
      params = {}
      parts = hash.match(route.path)
      params[route.names[i]] = value for value, i in parts.slice(1, parts.length)
      route.callback.call(App.main, params)
    else
      false

  match: (hash) ->
    for route in @routeList
      if route.path.test(hash)
        return route


$ ->
  $(window).bind "statechange", ->
    App.router.dispatch(History.getState().data.path)

  $(document).on "click", "a.navigable", (e) ->
    e.preventDefault()
    App.router.navigate $(e.currentTarget).attr("href"), $(e.currentTarget).attr("data-title"), {id: $(e.currentTarget).attr("data-id")}

  App.router.navigate "/", "ShoppingEmber: Products", {}