class window.MoneyView extends Backbone.View
  className: 'money'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'disableBet', @disableButton)
    @listenTo(@model, 'enableBet', @enableButton)
    @render()

  template: _.template('<p>Cash: $<%= cash %></p> \
                        <p>Bet : <%= currentBet %></p>')

  buttons: $('<button class="increase-bet">+</button> \
              <button class="decrease-bet">-</button> \
              <button class="place-bet">Place bet</button>')

  events:
    'click .increase-bet': ->
      @model.increaseBet()
      @render()
    'click .decrease-bet': ->
      @model.decreaseBet()
      @render()
    'click .place-bet': ->
      @model.placeBet()
      @disableButton()
      @render()

  disableButton: ->
    @$('button').attr('disabled', true)

  enableButton: ->
    @$('button').attr('disabled', false)

  render: ->
    @$el.html(@template(@model.attributes)).append(@buttons)
    @
