class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="./img/cards/<%= rankName %>-<%= suitName %>.png">'

  initialize: -> @render()

  render: ->
    attributes = 
      suitName: @model.get('suitName').toLowerCase()
      rankName: @model.get('rankName').toString().toLowerCase()
    @$el.children().detach()
    if @model.get('revealed')
      @$el.html @template attributes
    else
      @$el.addClass 'covered' unless @model.get 'revealed'

