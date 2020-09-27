require_relative 'board'
require_relative 'game'

board = Board.new

system('clear')
board.draw

puts "Player 1, what's your name?"
p1_name = gets.chomp

puts "\n"
puts "Player 2, what's your name?"
p2_name = gets.chomp

game = Game.new([p1_name, p2_name])
game.set_sides
winner = nil
until winner
  system('clear')
  board.draw

  if game.x_turn?
    puts "X - #{game.x_player}, make your move!"
    move = gets.chomp
    board.make_move(move, 'X')
    if board.move_made
      game.pass_turn
    end
    winner = board.won?
  else
    puts "O - #{game.o_player}, make your move!"
    move = gets.chomp
    board.make_move(move, 'O')
    if board.move_made
      game.pass_turn
    end
    winner = board.won?
  end
end

system('clear')
board.draw

if winner == 'X'
  puts "\nYay. #{game.x_player} is the winner. Neat."
elsif winner == 'O'
  puts "\nYay. #{game.o_player} is the winner. Neat."
end