class Board
attr_reader :size, :players, :spaces

  def initialize(size,players)
    @size = size
    @players = players
    @spaces = Array.new(@size+1)

    count = 0
    while (count < size+1) do
      @spaces[count] = []
      count +=1
    end

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
    count = 0
    for space in @spaces
      if (space.count == 0)
        puts "#{count}"
      elsif (space.count == 1)
        puts "#{count} #{space[0].name}"
      elsif (space.count == 2)
        puts "#{count} #{space[0].name} #{space[1].name}"
      end
      count +=1
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
          move = thing.destination - updated
          break
        else
          finished_update = true
        end
      end

    end
  end

end
