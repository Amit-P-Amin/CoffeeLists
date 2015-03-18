class CoffeeLists.Routers.Router extends Backbone.Router
  routes:
    '': 'home'

  home: ->
    items = new CoffeeLists.Collections.Items()
    items.fetch
      success: ->
        new CoffeeLists.Views.LayoutView(
          collection: items
          el: '.content'
        )
