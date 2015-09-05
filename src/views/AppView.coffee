class window.AppView extends Backbone.View

  className: 'app-view'

  events:
    'click .new-game': (event) -> @model.newGame(); @model.get('money').enableBet()

  initialize: ->
    @model.on 'change', @render, @
    @render()

  render: ->
    @$el.children().detach()
    @$el.append new GameView(model: @model.get 'game').el
    @$el.append new MoneyView(model: @model.get 'money').el