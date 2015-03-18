class CoffeeLists.Views.LayoutView extends Backbone.CompositeView
  initialize: (options) ->
    @collection.on("change", @render.bind(this))

  events:
    'click button.close': 'close'
    'click button.open': 'open'

  render: ->
    @$el.html(HandlebarsTemplates['layout']())
    @renderChildren(@collection)
    this

  renderChildren: (items, location) ->
    for item in items.models
      itemView = new CoffeeLists.Views.ItemView(item)
      parent_id = item.get("parent_id")

      if parent_id == null
        location = '.main-list'
      else
        location = "#item" + parent_id
      this.addSubview(location, itemView)
      if item.items.length > 0
        @renderChildren(item.items, location)

  close: (event) ->
    event.preventDefault()
    button = $(event.target)
    list = button.next()
    button.text('+')
    button.removeClass("close")
    button.addClass("open")
    list.slideUp({
      "duration": 150
    });

  open: (event) ->
    event.preventDefault()
    button = $(event.target)
    list = button.next()
    button.text('-')
    button.removeClass("open")
    button.addClass("close")
    list.slideDown({
      "duration": 150
    });
