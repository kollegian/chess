class Rook
  attr_accessor :position
  def initialize(side)
    if side=="white"
      @symbol="\u265c"
    else
      @symbol="\u2656"
    end
    @side=side
    @position=[]
  end
  def to_s
    @symbol
  end
  def set_position(a,b)
    @position.push(a)
    @position.push(b)
  end
end
