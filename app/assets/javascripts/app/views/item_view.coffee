class CoffeeLists.Views.ItemView extends Backbone.View
  initialize: (item) ->
    @item = item
    @data = {title: @item.escape("title"), content: @item.escape("content"), id: @item.id}

  events:
    'click button.edit-item': 'edit'
    'click button.update-item': 'update'

  render: ->
    if @item.items.length > 0
      $content = $(HandlebarsTemplates['parentItem'](@data))
    else
      $content = $(HandlebarsTemplates['item'](@data))
    @bindMoveHandlers($content)
    @$el.html($content)
    this

  edit: ->
    event.preventDefault()
    content = HandlebarsTemplates['itemEdit'](@data)
    @$el.html(content)

  update: ->
    event.preventDefault()
    @data = {title: @$el.find(".title").val(), content: @$el.find(".content").val(), id: @item.id}
    @item.set(@data)
    @item.save({})

  bindMoveHandlers: ($content) ->
    @bindDrop($content)
    @bindDrag($content)

  bindDrop: ($content) ->
    $content.droppable(
      drop: ((event, ui) ->
        draggedItem = $(ui.draggable)
        @setData(draggedItem, ui.position)
      ).bind(this)
    )

  setData: (draggedItem, position) ->
    draggedItem.data("new_parent_id", @item.id)
    if position.left < 800
      draggedItem.data("reorder", "true")
    draggedItem.data("new_position", @item.get("position") + 1);

  bindDrag: ($content) ->
    $content.draggable(
      revert: "invalid"
      stop: ((event, ui) ->
        itemData = $(event.target).data()
        @stopCallback(itemData)
      ).bind(this)
    )

  stopCallback: (itemData) ->
    new_position = itemData.new_position
    new_parent = itemData.new_parent_id
    if itemData.reorder == "true"
      @reorder(new_position, new_parent)
    else
      @changeList(new_position, new_parent)

  reorder: (new_position, priorItemId) ->
    @$el.css({top: 0, left: 0, position:'relative'});
    @$el.find("li").css({top: 0, left: 0, position:'relative'});
    $("#" + priorItemId).after(@$el)
    data = {currentItemId: @item.id, new_position: new_position, priorItemId: priorItemId}

    $.ajax({
      type: "POST"
      url: "api/items/reOrder"
      data: data
    })
