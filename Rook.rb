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
    @moves=[]
    for j in (@position[1]+1)..7 do
      if @@arr[x][j]==" "
        @moves.push([x,j])
      elsif @@arr[x][j]!=" " && @@arr[x][j].side!=@side
        @moves.push([x,j]) 
        break
      else
        break
      end
    end
    for j in (position[0]+1)..7 do
      if @@arr[j][y]==" "
        @moves.push([j,y])
      elsif @@arr[j][y]!=" " && @@arr[j][y].side!=@side
        @moves.push([j,y])
        break
      else 
        break
      end
    end
    for j in (position[0]-1).downto(0) do
      if @@arr[j][y]==" "
        @moves.push([j,y])
      elsif @@arr[j][y]!=" " && @@arr[j][y].side!=@side
        @moves.push([j,y]) 
        break
      else
        break 
      end
    end
    for j in (position[1]-1).downto(0) do
      if @@arr[x][j]==" "
        @moves.push([x,j])
      elsif @@arr[x][j]!=" " && @@arr[x][j].side!=@side
        @moves.push([x,j])
        break
      else
        break
      end
    end
    p @moves
    return @moves.include?([a,b])
  end 
end
