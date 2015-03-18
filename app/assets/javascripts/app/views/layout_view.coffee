class CoffeeLists.Views.LayoutView extends Backbone.CompositeView
  initialize: (options) ->
    @collection.on("change", @render.bind(this))

  events:
    'click button.close': 'close'

  render: ->
    @$el.html(HandlebarsTemplates['layout']())
    @renderChildren(@collection, '.main-list')
    this

  renderChildren: (items, location) ->
    for item in items.models
      itemView = new CoffeeLists.Views.ItemView(item)
      this.addSubview(location, itemView)
      if item.items.length > 0
        location = "#item" + item.id
        @renderChildren(item.items, location)

  close: ->
    list = $(event.target).next()

    list.slideUp({
      "duration": 100
    });
