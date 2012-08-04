App.ItemsController = Ember.ArrayController.extend

  init: ->
    @_super()
    @resetContent()

  storeDidChange: (-> @resetContent()).observes("store")

  resetContent: ->
    @set("page", 0)
    @set("next_page", 1)
    @set("total_pages", 1)
    @set("content", [])

  per_page: (->
    if @get("next_page") is 1 then 19 else 20
    ).property("next_page")

  storeTitle: (->
    @get("store").titleize()
    ).property("store")

  storeFragment: (->
    @get("store").toLowerCase()
    ).property("store")

  getItems: ->
    self = @
    $.ajax
      url: "/products/"
      type: "GET"
      contentType: "application/json"
      dataType: "json"
      data: 
        page: @.get("next_page")
        per_page: @get("per_page")
        store: @get("store")

      success: (data, status, xhr) ->
        self.setContent(data)
        self.handlePaging(xhr)

  setContent: (data) ->
    @addObject(App.Product.create(item)) for item in data

  handlePaging: (xhr) ->
    pagination = xhr.getResponseHeader("X-Pagination")
    @setHeader(header) for header in pagination.split(", ")

  setHeader: (header) ->
    kv = header.split(": ")
    key = kv[0]
    value = kv[1]
    @set(key, parseInt(value))