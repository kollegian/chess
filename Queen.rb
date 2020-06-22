require_relative "Board"
class Queen < Board
  attr_accessor :position, :side
  def initialize(side)
    if side=="white"
      @symbol="\u265B"
    else
      @symbol="\u2655"
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
    if can_move?.include?([a,b])
      @position[0]=a
      @position[1]=b
    else
      "wrong move"
    end
  end
  def unmove(a,b)
    @position[0]=a
    @position[1]=b
  end
  def can_move?
    @moves=[]
    possible_moves=[[1,1],[-1,-1],[1,-1],[-1,1],[0,-1],[0,1],[-1,0],[1,0]]
    possible_moves.each do |move|
      nextx=@position[0]+move[0]
      nexty=@position[1]+move[1]
      next if nextx<0 || nexty<0 || nextx>7 || nexty>7
      while @@arr[nextx][nexty]==" " 
        @moves.push([nextx, nexty])
        nextx=nextx+move[0]
        nexty=nexty+move[1]
        break if nextx<0 || nexty<0 || nextx>7 || nexty>7
      end
      if (nextx>=0 && nextx<8 && nexty>=0 && nexty<8) && @@arr[nextx][nexty].side!=@side
        @moves.push([nextx, nexty])
      end
    end
    if @side=="white"
      @@wmoves.push(@moves)
    else
      @@bmoves.push(@moves)
    end
    return @moves
  end  
end

