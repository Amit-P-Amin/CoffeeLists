class CoffeeLists.Models.Item extends Backbone.Model
  urlroot: 'api/items/'

  parse: (response) ->
    this.items = new CoffeeLists.Collections.Items(response.items, {parse: true})
    return response;
