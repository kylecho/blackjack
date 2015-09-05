class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, options) ->
    @score = @scores()[0]
    @deck = options.deck
    @isDealer = options.isDealer

  hit: ->
    @add(@deck.pop().flip())
    if @scores()[0] > 21
      @score = 0
      @trigger 'done'
    @last()

  dealerHit: ->
    debugger
    @first().flip()
    # @hit() while @scores()[0] < 17
    while @scores()[0] < 17
      @add(@deck.pop().flip()) 
    @score = @scores()[0]
    if @score > 21
      @score = 0
    @trigger 'done'

  stand: ->
    @score = @scores()[0]
    @trigger 'done'

  hasAce: -> @reduce (memo, card) ->
    memo or card.get 'value' is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  startGame: ->
    if @isDealer then @at(1).flip()
    else @each (card) -> card.flip()