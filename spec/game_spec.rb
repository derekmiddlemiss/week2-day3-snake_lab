require('minitest/autorun')
require_relative('../game')
require_relative('../board')
require_relative('../player')
require_relative('../dice')

class TestGame < MiniTest::Test

def setup

  @player1 = Player.new("John")
  @player2 = Player.new("Wendy")
  players = [@player1,@player2]
  @board = Board.new(30,players)
  @dice = Dice.new

end

def test_game

end