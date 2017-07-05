class Player
attr_reader :name, :current_position

def initialize(name)
  @name = name
  @current_position = 1
end

def move_player(number_of_spaces)
 @current_position += number_of_spaces
end


end