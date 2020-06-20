require_relative "Board"
class Pond < Board
  attr_accessor :side, :position
  def initialize(side)
    if side=="black"
      @symbol="\u2659"      
      @side=side
    end
    if side=="white"
      @symbol="\u265F"      
      @side=side
    end
    @position=[]
    @moves=[]    
  end
  def to_s
    return @symbol
  end
  def set_position(a,b)
    @position.push(a)
    @position.push(b)
  end
  def move(a,b)
    if legal?(a,b)
      @position=[]
      @position.push(a)
      @position.push(b)
    else
      "wrong move"
    end
  end
  def legal?(a,b)
    @moves=[]
    x=@position[0]
    y=@position[1]
    if @side=="white"
      if x==1
        if @@arr[x+2][y]==" "
        @moves.push([x+2,y])
        end
      end
      if @@arr[x+1][y]==" "
      @moves.push([x+1,y])
      end
      if @@arr[x+1][y+1]!=nil && @@arr[x+1][y+1]!=" " && @@arr[x+1][y+1].side=="black"
        @moves.push([x+1, y+1])
      end 
      if @@arr[x+1][y-1]!=nil && @@arr[x+1][y-1]!=" " && @@arr[x+1][y-1].side=="black"
        @moves.push([x+1, y-1])
      end  
    else 
      if x==6 && @@arr[x-2][y]==" "
        @moves.push([x-2,y])
      end
      if @@arr[x-1][y]==" "
      @moves.push([x-1,y])
      end
      if @@arr[x-1][y-1]!=nil && @@arr[x-1][y-1]!=" "&& @@arr[x-1][y-1].side=="white"
        @moves.push([x-1,y-1])
      end
      if @@arr[x-1][y+1]!=nil && @@arr[x-1][y+1]!=" " && @@arr[x-1][y+1].side=="white"
        @moves.push([x-1,y+1])
      end
    end
    @moves=@moves.select{|arrays| !arrays.any?{|a| a<0}}
    p @moves
    return @moves.include?([a,b])
  end
end

