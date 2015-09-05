# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'money', new Money()
    @newGame()

  newGame: ->
    # debugger
    @set 'game', game = new Game()
    @listenTo game, 'gameOver', ->
      player = game.get('playerHand')
      dealer = game.get('dealerHand')
      switch
        when player.score > dealer.score then @get('money').win()
        when player.score < dealer.score then @get('money').lose()
        else @get('money').push()
    game.get('playerHand').on('add', => @get('money').disableBet())
    @get('money').enableBet()