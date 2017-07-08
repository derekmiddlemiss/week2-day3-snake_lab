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

