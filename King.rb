class King
  attr_accessor :position
  def initialize(side)
    if side=="white"
      @symbol="\u265A"
    else
      @symbol="\u2654"
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