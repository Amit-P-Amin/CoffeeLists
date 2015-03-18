class CoffeeLists.Views.ItemView extends Backbone.View
  initialize: (item) ->
    @item = item
    @data = {title: @item.escape("title"), content: @item.escape("content"), id: @item.id}

  events:
    'click button.edit-item': 'edit'
    'click button.update-item': 'update'

  render: ->
    if @item.items.length > 0
      content = HandlebarsTemplates['parentItem'](@data)
    else
      content = HandlebarsTemplates['item'](@data)
    @$el.html(content);
    this

  edit: ->
    event.preventDefault()
    content = HandlebarsTemplates['itemEdit'](@data)
    @$el.html(content);

  update: ->
    event.preventDefault()
    @data = {title: @$el.find(".title").val(), content: @$el.find(".content").val(), id: @item.id}
    @item.set(@data)
    @item.save({})
