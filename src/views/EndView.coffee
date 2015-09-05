class window.EndView extends Backbone.View
  template: _.template '<p><%= winner %></p> \
                        <button class="new-game">Play Again</button>'

  # events:

  initialize: ->
    @render()

  render: ->
    player = @model.get('playerHand')
    dealer = @model.get('dealerHand')
    switch
      when player.score > dealer.score then winner = 'Player wins!'
      when player.score < dealer.score then winner = 'Dealer wins!'
      else winner = 'Push'
    @$el.html(@template(winner: winner))
    @