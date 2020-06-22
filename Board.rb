
class Board
    attr_accessor :arr
  def initialize
    @@arr=Array.new
    8.times do 
     @@arr.push(Array.new(8, " "))
    end
    @@wmoves=[]
    @@bmoves=[]
    @wking=nil
    @bking=nil
  end
require_relative "Pond"
require_relative "Knight"
require_relative "Rook"
require_relative "King"
require_relative "Queen"
require_relative "Bishop"
  def print_board
    i=0
    puts "  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
    puts "  ---------------------------------"
    @@arr.each do |row|
      print i
      print " "
      row.each do |cell|
        print "| #{cell} "
      end
      print "| #{i}"
      puts 
      puts "   --------------------------------"
      i+=1
    end
    puts "  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
  end
  def start_game
    for j in (0..7) do
      a=Pond.new("white")
      b=Pond.new("black")
      a.set_position(1,j)
      b.set_position(6,j)
      @@arr[1][j]=a
      @@arr[6][j]=b
    end
    j=2
    2.times do
    a=Knight.new("white")
    b=Knight.new("black")
    a.set_position(0,j)
    b.set_position(7,j)  
    @@arr[0][j]= a
    @@arr[7][j]= b
    j+=3
    end
    j=0  
    2.times do
      a=Rook.new("white")
      b=Rook.new("black")
      a.set_position(0,j)
      b.set_position(7,j)
      @@arr[0][j]=a
      @@arr[7][j]=b
      j+=7
    end
    @wking=King.new("white")
    @bking=King.new("black")
    @wking.set_position(0,3)
    @bking.set_position(7,3)
    @@arr[0][3]=@wking
    @@arr[7][3]=@bking 
    j=1
    2.times do
      a=Bishop.new("white")
      b=Bishop.new("black")
      a.set_position(0,j)
      b.set_position(7,j)
      @@arr[0][j]=a
      @@arr[7][j]=b
      j+=5
    end
    a=Queen.new("white")
    b=Queen.new("black")
    a.set_position(0,4)
    b.set_position(7,4)
    @@arr[0][4]=a
    @@arr[7][4]=b
  end
  def refresh_positions
    @@wmoves=[]
    @@bmoves=[]
    @@arr.each do |rocks|
      rocks.each do |cell|
        if cell!=" "
          cell.can_move?
        end
      end
    end
  end
  def choose(a,b)
    refresh_positions
    rock=@@arr[a][b]
    puts "where to go:"
    print "x: "
    x=gets.chomp.to_i
    print "y: "
    y=gets.chomp.to_i
    if is_check?
      result=rock.move(x,y)
      if result !="wrong move"
        @@arr[x][y]=rock
        @@arr[a][b]=" "
      end
      refresh_positions
      if is_check?
        rock.unmove(a,b)
        @@arr[x][y]=" "
        @@arr[a][b]=rock
        puts "Check!! Please choose again."
      end
    else
      result=rock.move(x,y)
      if result !="wrong move"
        @@arr[x][y]=rock
        @@arr[a][b]=" "
        refresh_positions
        is_check?
      end
    end    
  end
  def is_check?
    @@wmoves.each do |arrays|
      if arrays.include?(@bking.position)
        puts "Check for Black King!!"
        return true
      end
    end
    @@bmoves.each do |arrays|
      if arrays.include?(@wking.position)
        puts "Check for White King"
        return true
      end
    end
    return false
  end    
end


