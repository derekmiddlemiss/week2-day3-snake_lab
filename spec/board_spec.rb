require('minitest/autorun')
require_relative('../board')
require_relative('../player')

class TestBoard < MiniTest::Test

  def setup

    @player1 = Player.new("John")
    @player2 = Player.new("Wendy")


    @board = Board.new(30,[@player1, @player2]) 

  end

  def test_board_size
    board = @board.size
    assert_equal(30, board)
  end

  def test_players_on_board
    assert_equal([@player1,@player2], @board.spaces[1])
  end

end