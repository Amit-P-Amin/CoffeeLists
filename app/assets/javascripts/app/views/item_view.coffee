class App.views.ItemView extends Backbone.View
  initialize: (item) ->
    @item = item
    @data = {title: @item.escape("title"), content: @item.escape("content")}

  render: ->
    content = HandlebarsTemplates['item'](@data)
    @$el.html(content);
    this

  edit: ->
    event.preventDefault()
    content = HandlebarsTemplates['itemEdit'](@data)
    @$el.html(content);

  update: ->
    event.preventDefault()
    @data = {title: @$el.find(".title").val(), content: @$el.find(".content").val()}
    @item.set(@data)
    @item.save({})
    @render()


  events:
    'click button.edit-item': 'edit'
    'click button.update-item': 'update'
