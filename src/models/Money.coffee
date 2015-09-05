class window.Money extends Backbone.Model
  defaults:
    'cash': 1000
    'currentBet': 0
    'betAmount': 10

  initialize: ->

  increaseBet: ->
    if  @get('betAmount') > @get('cash')
      return
    @set 'cash', @get('cash') - @get('betAmount')
    @set 'currentBet', @get('currentBet') + @get('betAmount')

  decreaseBet: ->
    if @get('currentBet') == 0
      return
    @set('cash', (@get('cash') + @get('betAmount')))
    @set('currentBet', (@get('currentBet') - @get('betAmount')))

  win: ->
    @set('cash', @get('cash') + ((@get 'currentBet') * 2))
    @set 'currentBet', 0

  lose: ->
    @set 'currentBet', 0

  push: ->
    @set('cash', @get('cash') + (@get 'currentBet'))
    @set 'currentBet', 0

  disableBet: ->
    @trigger 'disableBet'

  enableBet: ->
    @trigger 'enableBet'

  placeBet: ->
    @trigger 'placeBet'
