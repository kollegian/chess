
class Pond
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
        @moves.push([x+2,y])
      end
      @moves.push([x+1,y])
    else 
      if x==6
        @moves.push([x-2,y])
      end
      @moves.push([x-1,y])
    end
    
    return @moves.include?([a,b])
  end
end

