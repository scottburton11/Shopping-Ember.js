App.ListView = Ember.CollectionView.extend
  itemViewClass: "App.ItemView"
  classNames: ["products list"]

  willInsertElement: ->
    console.log "willInsertElement"

  # didInsertElement: ->
  #   console.log "List: didInsertElement"
  #   console.log $(".item")
  #   $.each $(".item"), (index, value) ->
  #     console.log index, value, $(value).offset().top