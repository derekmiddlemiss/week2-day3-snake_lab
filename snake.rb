class Snake

  attr_reader :destination, :name

  def initialize(location, destination)
    if ( destination < location )
      @name = "SNAKE to #{destination}"
      @location = location
      @destination = destination
    else
      raise "Incorrect snake"
    end
  end

end

hissy = Snake.new(12,5)
puts hissy.destination
