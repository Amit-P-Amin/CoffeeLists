class App.views.LayoutView extends Backbone.CompositeView
  initialize: (options) ->
    @collection = new App.collections.Items(options.data)
    @render()

  render: ->
    @$el.html HandlebarsTemplates['layout']()

    for item in @collection.models
      itemView = new App.views.ItemView(item)
      this.addSubview('.main-list', itemView)
