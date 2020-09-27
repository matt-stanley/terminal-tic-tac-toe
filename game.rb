## This class will keep track of player names, whose turn it is, randomly assign a side.
class Game
  attr_reader :x_player
  attr_reader :o_player

  def initialize(names)
    @players = {
      names[0] => '',
      names[1] => ''
    }

    @x_turn = true
  end

  def set_sides
    if rand(2) == 0
      @players[@players.keys[0]] = 'X'
      @players[@players.keys[1]] = 'O'
    else
      @players[@players.keys[0]] = 'O'
      @players[@players.keys[1]] = 'X'
    end

    @x_player = player_with('X')
    @o_player = player_with('O')
  end

  def pass_turn
    @x_turn = !@x_turn
  end

  def x_turn?
    @x_turn
  end

  def player(index)
    @players.keys[index]
  end

  def player_with(mark)
    @players.key(mark)
  end

  def player_names
    @players.keys.to_a
  end

end
