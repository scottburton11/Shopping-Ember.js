App.DetailView = Ember.View.extend
  templateName: "detail"
  classNames: ["detail"]
  contentBinding: "contentController.content"
  inCartBinding: "contentController.inCart"

  addToCart: (e) ->
    @contentController.addToCart()
    e.preventDefault()

  # inCart: (-> @get("contentController").get("inCart")).property("content")

  cartStatus: (-> if @get("inCart") then "In Cart" else "Add To Cart").property("inCart")

  categoryFragment: (-> "/" + @get("category").toLowerCase()).property("category")