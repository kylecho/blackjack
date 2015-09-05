class window.AppView extends Backbone.View

  className: 'app-view'

  events:
    'click .new-game': => @model.newGame()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.append new GameView(model: @model.get 'game').el
