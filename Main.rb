require_relative "Pond"
require_relative "Knight"
require_relative "Rook"
require_relative "King"
require_relative "Queen"
require_relative "Bishop"
require_relative "Board"

game=Board.new
game.start_game
game.print_board
puts "command: "
x=gets.chomp
while x!="stop"
  cord1=gets.chomp.to_i
  cord2=gets.chomp.to_i
game.choose(cord1, cord2)
game.print_board
puts "command:"
x=gets.chomp   
end 