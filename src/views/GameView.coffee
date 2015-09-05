class window.GameView extends Backbone.View
  className: 'game-view'

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @model.on 'gameOver', @showWinner, @
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  showWinner: ->
    console.log 'showWinner invoked'
    player = @model.get('playerHand')
    dealer = @model.get('dealerHand')
    switch
      when player.score > dealer.score then winner = 'Player'
      when player.score < dealer.score then winner = 'Dealer'
      else winner = 'Push'
    @$el.append(new EndView(model: @model).render().el)

