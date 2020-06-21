require_relative "Board"
class Knight < Board
  attr_accessor :position, :side
  def initialize(side)
    if side=="white"
      @symbol="\u265e"
    else
      @symbol="\u2658"
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
    @moves=[]
    possible_moves=[[1,2],[1,-2],[2,1],[2,-1],[-1,2],[-1,-2],[-2,1],[-2,-1]]
    possible_moves.each do |move|
      nextx=@position[0]+move[0]
      nexty=@position[1]+move[1]
      next if nextx<0 || nexty <0 || nextx>7 || nexty>7
      if @@arr[nextx][nexty]==" "
        @moves.push([nextx, nexty])
      end
      if @@arr[nextx][nexty]!=" " && @@arr[nextx][nexty].side!=@side
        @moves.push([nextx,nexty])
      end
    end
    p @moves
    return @moves.include?([a,b])
  end
end


