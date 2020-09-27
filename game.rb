## This class will keep track of player names, whose turn it is, randomly assign a side.
class GAME
  def initialize(names)
    @players = {
      names[0] => {},
      names[1] => {}
    }

    set_sides

    @x_turn = true
  end

  def self.set_sides
    if rand(2).zero?
      @players.keys[0] = 'X'
      @players.keys[1] = 'O'
    else
      @players.keys[0] = 'O'
      @players.keys[1] = 'X'
    end
  end

  def pass_turn
    @x_turn = !@x_turn
  end

  def x_turn?
    x_turn
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
