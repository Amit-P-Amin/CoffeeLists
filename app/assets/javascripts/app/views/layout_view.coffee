class CoffeeLists.Views.LayoutView extends Backbone.CompositeView
  initialize: (options) ->
    @render()

  render: ->
    @$el.html HandlebarsTemplates['layout']()

    for item in @collection.models
      itemView = new CoffeeLists.Views.ItemView(item)
      this.addSubview('.main-list', itemView)
