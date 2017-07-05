require_relative('./board')
require_relative('./player')
require_relative('./dice')
require_relative('./snake')
require_relative('./ladder')


class Game

  def initialize
    puts "Welcome to Snakes and Ladders"

    # puts "What size of game would you like?"
    # @size = gets.chomp.to_i
    @size = 30

    puts "How many players?"
    @number_of_players = gets.chomp.to_i
    @players = Array.new(@number_of_players)

    for count in 0..@number_of_players-1 do
      puts "What is the name of player #{count+1}?"
      name = gets.chomp
      @players[count]=Player.new(name)
    end

    @board = Board.new(@size,@players)

    @dice = Dice.new

    puts "Starting board"
    @board.print
    gets.chomp

  end

  def play

    @victory = false

    while (@victory == false) do
      for player in @players do

        move = @dice.roll_dice
        puts "#{player.name} has rolled #{move}"
        if ( player.current_position + move >= @size )
          @victory = true
          puts "#{player.name} has won"
          break
        else
          @board.update(player,move) #check whether is a ladder or a snake
        end

        @board.print
        input = gets.chomp
        puts ""

      end
    end

  end

end

sandl = Game.new()
sandl.play()
