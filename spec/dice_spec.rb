require('minitest/autorun')
require_relative('../dice')

class TestDice < MiniTest::Test

  def test_roll_dice
    a=1..100
    dice = Dice.new
    for trial in a
      roll = dice.roll_dice
      accept = false
      accept = true if ( roll <= 6 && roll >= 1 )
      assert_equal( true, accept )
    end
  end

end