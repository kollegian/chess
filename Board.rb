require_relative "Pond"
require_relative "Knight"
require_relative "Rook"
require_relative "King"
require_relative "Queen"
require_relative "Bishop"
class Board
    attr_accessor :arr
  def initialize
    @arr=Array.new
    8.times do 
      @arr.push(Array.new(8, " "))
    end
  end
  def print_board
    i=1
    puts "  | A | B | C | D | E | F | G | H |"
    puts "  ---------------------------------"
    @arr.each do |row|
      print i
      print " "
      i+=1
      row.each do |cell|
        print "| #{cell} "
      end
      print "|"
      puts 
      puts "   --------------------------------"
    end
  end
  def start_game
    for j in (0..7) do
      a=Pond.new("white")
      b=Pond.new("black")
      a.set_position(1,j)
      b.set_position(6,j)
      @arr[1][j]=a
      @arr[6][j]=b
    end
    j=2
    2.times do
    a=Knight.new("white")
    b=Knight.new("black")
    a.set_position(0,j)
    b.set_position(7,j)  
    @arr[0][j]= a
    @arr[7][j]= b
    j+=3
    end
    j=0  
    2.times do
      a=Rook.new("white")
      b=Rook.new("black")
      a.set_position(0,j)
      b.set_position(7,j)
      @arr[0][j]=a
      @arr[7][j]=b
      j+=7
    end
    a=King.new("white")
    b=King.new("black")
    a.set_position(0,3)
    b.set_position(7,3)
    @arr[0][3]=a
    @arr[7][3]=b 
    j=1
    2.times do
      a=Bishop.new("white")
      b=Bishop.new("black")
      a.set_position(0,j)
      b.set_position(0,j)
      @arr[0][j]=a
      @arr[7][j]=b
      j+=5
    end
    a=Queen.new("white")
    b=Queen.new("black")
    a.set_position(0,4)
    b.set_position(7,4)
    @arr[0][4]=a
    @arr[7][4]=b
  end
  def choose(a,b)
    rock=@arr[a][b]
    puts "where to go:"
    print "x: "
    x=gets.chomp.to_i
    print "y: "
    y=gets.chomp.to_i
    result=rock.move(x,y)
    if result !="wrong move"
    @arr[x][y]=rock
    @arr[a][b]=" "
    end  
  end
end


