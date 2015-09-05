class window.MoneyView extends Backbone.View
  className: 'money'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @render()

  template: _.template('<p>Cash: <%= cash %></p> \
                        <p>Bet : <%= currentBet %></p> \
                        <button class="increase-bet">+</button> \
                        <button class="decrease-bet">-</button>')

  events:
    'click .increase-bet': ->
      @model.increaseBet()
      @render()
    'click .decrease-bet': ->
      @model.decreaseBet()
      @render()


  render: ->
    @$el.html(@template(@model.attributes))
    @
