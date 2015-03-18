class CoffeeLists.Views.LayoutView extends Backbone.CompositeView
  initialize: (options) ->
    @collection.on("change", @render.bind(this))

  events:
    'click button.close': 'close'
    'click button.open': 'open'

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
    button = $(event.target)
    list = button.next()
    button.text('+')
    button.removeClass("close")
    button.addClass("open")
    list.slideUp({
      "duration": 150
    });

  open: ->
    button = $(event.target)
    list = button.next()
    button.text('-')
    button.removeClass("open")
    button.addClass("close")
    list.slideDown({
      "duration": 150
    });
