class Ladder

  attr_reader :destination, :name

  def initialize(location, destination)
    if ( destination > location )
      @name = "LADDER to #{destination}"
      @location = location
      @destination = destination
    else
      raise "Incorrect ladder"
    end
  end

end