App.CartView = Ember.View.extend
  tagName: "span"
  templateName: "cart"
  cartBinding: "App.cart"
  itemsInCartBinding: "App.cart.itemsInCart"