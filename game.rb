require_relative('./board')
require_relative('./player')
require_relative('./dice')

# puts "Welcome to Snakes and Ladders"
# puts "What size of game would you like?"
# size = gets.chomp.to_i
# puts "How many players?"
# number_of_players = gets.chomp.to_i

# for count in 1..number_of_players do
#   puts "What is the name of player #{count}?"
#   name = gets.chomp
#   pl

player1 = Player.new("John")
player2 = Player.new("Wendy")
players = [player1,player2]
board = Board.new(30,players)
dice = Dice.new

victory = false

while (victory == false) do
  for player in players do
    move = dice.roll_dice
    puts "Player #{player} has rolled #{move}"
    board.update(player,move)
    player.move_player(move)
    board.print
    input = gets.chomp
    puts ""
  end
end
