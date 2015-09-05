assert = chai.assert

describe 'Game', ->
  game = null

  beforeEach ->
    game = new Game()

  describe 'Rules', ->
    it 'Player busts if they keep hitting', ->
      game.get('playerHand').hit() for [0...10]
      assert(game.get('playerHand').scores()[0] > 21, 'Player\'s score should be greater than 21')

    it 'Dealer should keep his score greater than 17', ->
      scores = []
      for [0...10]
        game = new Game()
        game.get('playerHand').stand()
        scores.push(game.get('dealerHand').score)
        # assert(game.get('dealerHand').score >= 17
      result = _.every scores, (score) -> score >= 17 or score == 0
      assert(result == true, 'Result should equal true')

    it 'Game ends', ->
      isEnd = null
      game.on 'gameOver', -> isEnd = true
      game.get('playerHand').stand()
      assert.equal(isEnd, true)
