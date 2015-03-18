class CoffeeLists.Routers.Router extends Backbone.Router
  initialize: ->
    @$rootEl = $('#main')

  routes:
    '': 'home'

  home: ->
    items = new CoffeeLists.Collections.Items()
    items.fetch
      success: (->
        layout = new CoffeeLists.Views.LayoutView(
          collection: items
        )
        @swapView(layout)
      ).bind(this)

  swapView: (view) ->
    @currentView && @currentView.remove()
    @currentView = view
    @$rootEl.html(view.render().$el)
