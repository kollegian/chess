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
    if can_move?.include?([a,b])
      @position=[]
      @position.push(a)
      @position.push(b)
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
    x=@position[0]
    y=@position[1]
    if @side=="white"
      if x==1
        possible_moves=[[2,0],[1,0]]
        possible_moves.each do |move|
          nextx=x+move[0]
          nexty=y+move[1]
          next if nextx>7 || nextx<0 || nexty<0 || nexty>7
          @moves.push([nextx, nexty]) if @@arr[nextx][nexty]==" "
        end
      else
        possible_moves=[1,0]
        nextx=x+possible_moves[0]
        nexty=y+possible_moves[1]
        if nextx<8 && nextx>=0 && nexty<8 && nexty>=0
          @moves.push([nextx, nexty]) if @@arr[nextx][nexty]==" "
          if @@arr[nextx][nexty-1]!=nil && @@arr[nextx][nexty-1]!=" " && @@arr[nextx][nexty-1].side!=@side
            @moves.push([nextx,nexty-1])
          end
          if @@arr[nextx][nexty+1]!=nil && @@arr[nextx][nexty+1]!=" " && @@arr[nextx][nexty+1].side!=@side
            @moves.push([nextx,nexty+1])
          end       
        end  
      end
    else 
      if x==6
        possible_moves=[[-2,0],[-1,0]]
        possible_moves.each do |move|
          nextx=x+move[0]
          nexty=y+move[1]
          next if nextx>7 || nextx<0 || nexty<0 || nexty>7
          @moves.push([nextx, nexty]) if @@arr[nextx][nexty]==" "
        end
      else
        possible_moves=[-1,0]
        nextx=x+possible_moves[0]
        nexty=y+possible_moves[1]
        if nextx<8 && nextx>=0 && nexty>=0 && nexty<8
          @moves.push([nextx, nexty]) if @@arr[nextx][nexty]==" "
        end
        if @@arr[nextx][nexty-1]!=nil && @@arr[nextx][nexty-1]!=" " && @@arr[nextx][nexty-1].side!=@side
          @moves.push([nextx,nexty-1])
        end
        if @@arr[nextx][nexty+1]!=nil && @@arr[nextx][nexty+1]!=" " && @@arr[nextx][nexty+1].side!=@side
          @moves.push([nextx,nexty+1])
        end             
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

