class Bishop
  attr_accessor :position, :side
  def initialize(side)
    if side=="white"
      @symbol="\u265D"
    else
      @symbol="\u2657"
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
