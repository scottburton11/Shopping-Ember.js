App.DetailView = Ember.View.extend
  templateName: "detail"
  classNames: ["detail"]
  inCartBinding: "content.inCart"

  addToCart: (e) ->
    @get("content").addToCart()
    console.log e
    e.preventDefault()

  back: (e) ->
    e.preventDefault()
    console.log e
    # href = $(e).attr("href")
    # App.navigate(href)
    App.main.index()

  cartStatus: Ember.computed(-> if @get("inCart") then "In Cart" else "Add To Cart").property("inCart")