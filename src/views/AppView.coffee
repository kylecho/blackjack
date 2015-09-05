class window.AppView extends Backbone.View

  className: 'app-view'

  events:
    'click .new-game': (event) -> @model.newGame()

  initialize: ->
    @model.on 'change', @render, @
    @render()

  render: ->
    @$el.children().detach()
    @$el.append new GameView(model: @model.get 'game').el
