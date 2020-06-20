require_relative "Pond"
require_relative "Knight"
require_relative "Rook"
require_relative "King"
require_relative "Queen"
require_relative "Bishop"
require_relative "Board"

game=Board.new
game.start_game
pond1=game.arr[6][0]
pond1.move(5,0)
p pond1.position
