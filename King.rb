require_relative "Board"
class King < Board
  attr_accessor :position, :side
  def initialize(side)
    if side=="white"
      @symbol="\u265A"
    else
      @symbol="\u2654"
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
    possible_moves=[[1,1],[1,0],[1,-1],[0,1],[0,-1],[-1,-1],[-1,0],[-1,1]]
    possible_moves.each do |move|
      nextx=@position[0]+move[0]
      nexty=@position[1]+move[1]
      next if nextx<0 || nextx>7 || nexty<0 || nexty>7
      if @@arr[nextx][nexty]==" "
        @moves.push([nextx,nexty])
      elsif @@arr[nextx][nexty].side!=@side
        @moves.push([nextx,nexty])
      end
    end
    if @side=="white"
      @@bmoves.each do |arrays|
        arrays.each do |move|
          if @moves.include?(move)
            @moves.delete(move)
          end
        end
      end
      @@wmoves.push(@moves)
    else
      @@wmoves.each do |arrays|
        arrays.each do |move|
          if @moves.include?(move)
            @moves.delete(move)
          end
        end
      end
      @@bmoves.push(@moves)
    end
    return @moves
  end   
end

          