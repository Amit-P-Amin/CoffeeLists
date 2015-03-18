window.CoffeeLists = {
  Views: {}
  Models: {}
  Collections: {}
  Routers: {}
  initialize: ->
    new CoffeeLists.Routers.Router
    Backbone.history.start()
}
