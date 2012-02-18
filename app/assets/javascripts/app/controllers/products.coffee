App.ItemsController = Ember.ArrayController.extend

  init: ->
    @_super()
    @.set("content", [])
    @.set("page", 0)
    @.set("next_page", 1)
    @.set("total_pages", 1)
    @.set("per_page", 20)

  getItems: ->
    self = @
    $.ajax
      url: "/products"
      type: "GET"
      contentType: "application/json"
      dataType: "json"
      data: 
        page: @.get("next_page")
        per_page: @.get("per_page")
        category: @.get("category")

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
    @.set(key, parseInt(value))