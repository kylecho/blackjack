class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on('done', => @get('dealerHand').dealerHit())
    @get('dealerHand').on('done', @end, @)

  end: ->
    @trigger 'gameOver'
