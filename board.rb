class Board
attr_reader :size, :players, :spaces

  def initialize(size,players)
    @size = size
    @players = players
    @spaces = Array.new( @size+1 )
    @spaces.map! { |space| space = [] }

    # @spaces = Array.new( @size+1 )
    # count = 0
    # while (count < size+1) do
    #   @spaces[count] = []
    #   count +=1
    # end

    put_players_on_board
    add_a_snake(12,5)
    add_a_snake(25,3)
    add_a_snake(14,2)
    add_a_ladder(4,10)
    add_a_ladder(6,20)
    add_a_ladder(11,18)

  end

  def put_players_on_board
    for player in @players
      @spaces[1].push(player)
    end
  end

  def add_a_snake(location,destination)
    @spaces[location].push( Snake.new(location,destination) )
  end

  def add_a_ladder(location,destination)
    @spaces[location].push( Ladder.new(location,destination) )
  end


  def print
    @spaces.each_with_index do |space, position|
      print_string = "#{position}-"
      space.each { |thing| print_string += " #{thing.name}" }
      puts print_string
    end
  end



  def update(player,move)

    finished_update = false

    while ( finished_update == false ) do

      current = player.current_position
      @spaces[current].delete(player)
      updated = current + move
      @spaces[updated].push(player)
      player.move_player(move)

      for thing in @spaces[updated]

        if (thing.class == Snake) || (thing.class == Ladder)
          puts "Hit a #{thing.class}!!"
          finished_update = false
          move = thing.destination - updated
          break
        else
          finished_update = true
        end

      end

    end
  end

end
