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

    for player in players
      @spaces[1].push(player)
    end

  end

  def print
    count = 0
    for space in @spaces
      puts "#{count}, #{@spaces[count]}"
      count +=1
    end
  end

  def update(player,move)
    current = player.current_position
    @spaces[current].delete(player)
    @spaces[current + move].push(player)
  end



  def add_event
  end

end
