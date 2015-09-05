# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @newGame()

  newGame: ->
    # debugger
    @set 'game', new Game()