class Board
  attr_reader :state

  # Set the initial state to a grid of a1 - c3, all set to empty strings
  def initialize
    @state = {}

    ('a'..'c').each do |a|
      (1..3).each do |i|
        @state["#{a}#{i}"] = ''
      end
    end
  end

  # When a player chooses a square, #add_mark is called to update the board state with X or O in its proper position.
  def add_mark(coord, mark)
    @state[coord] = mark
  end

  # A winning line has to pass through (0-index) position 1, 3, 4, 5, or 7.
  # To check for win condition, we check 1 and 7 for a horizontal win, 3 and 5 for a vertical win,
  #   and the center, position 4, for vertical, horizontal, diagonal-right, and diagonal-left wins.
  def won?
    [1, 3, 5, 7, 4].each do |pos|
      if @state.values[pos] != ''
        if [1, 7].include?(pos)
          if @state.values[pos] == @state.values[pos - 1] && @state.values[pos] == @state.values[pos + 1]
            return @state.values[pos]
          end
        elsif [3, 5].include?(pos)
          if @state.values[pos] == @state.values[pos - 3] && @state.values[pos] == @state.values[pos + 3]
            return @state.values[pos]
          end
        elsif pos == 4
          if @state.values[pos] == @state.values[pos - 1] && @state.values[pos] == @state.values[pos + 1] ||
             @state.values[pos] == @state.values[pos - 3] && @state.values[pos] == @state.values[pos + 3] ||
             @state.values[pos] == @state.values[pos - 4] && @state.values[pos] == @state.values[pos + 4] ||
             @state.values[pos] == @state.values[pos - 2] && @state.values[pos] == @state.values[pos + 2]

            return @state.values[pos]
          end
        end
      end
    end
    false
  end
end

board = Board.new