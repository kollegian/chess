require_relative "Board"
class Rook < Board
  attr_accessor :position, :side
  def initialize(side)
    if side=="white"
      @symbol="\u265c"
    else
      @symbol="\u2656"
    end
    @side=side
    @position=[]
    @moves=[]
  end
  def to_s
    @symbol
  end
  def set_position(a,b)
    @position.push(a)
    @position.push(b)
  end 
  def move(a,b)
    if legal?(a,b)
      @position=[]
      @position[0]=a
      @position[1]=b
    else
      "wrong move"
    end
  end
  def legal?(a,b)
    x=@position[0]
    y=@position[1]
    if @side=="white"
      nextx=x+1
      nexty=y
      @moves=[]
      while @@arr[nextx][nexty]==" " && nextx<8
        @moves.push([nextx,nexty])
        nextx+=1
      end
      nextx=x
      nexty=y+1
      while @@arr[nextx][nexty]==" " && nexty<8
        @moves.push([nextx,nexty])
        nexty+=1
      end
      nextx=x
      nexty=y-1
      while @@arr[nextx][nexty]==" " && nexty>=0
        @moves.push([nextx,nexty])
        nexty-=1
      end
    else 
      nextx=x-1
      nexty=y
      while @@arr[nextx][nexty]==" " && nextx>=0
        @moves.push([nextx,nexty])
        nextx-=1
      end
      nextx=x
      nexty=y-1
      while @@arr[nextx][nexty]==" " && nexty>=0
        @moves.push([nextx,nexty])
        nexty-=1
      end
      nextx=x
      nexty=y+1
      while @@arr[nextx][nexty]==" " && nexty<8
        @moves.push([nextx, nexty])
        nexty+=1
      end
    end
  end      
end
