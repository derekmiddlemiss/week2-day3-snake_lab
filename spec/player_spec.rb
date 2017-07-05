require('minitest/autorun')
require_relative('../player')

class TestDice < MiniTest::Test

  


  def test_player_name
    player = Player.new("John")
    assert_equal("John", player.name)
  end

  def test_player_position
    player = Player.new("John")
    player_position = player.move_player(4)
    assert_equal(5, player.current_position)
  end

end