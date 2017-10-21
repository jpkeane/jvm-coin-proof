class ResultCounter
  def initialize(side)
    @size = side
    @count = 0.0
  end

  def increment
    @count += 1
  end

  def to_s
    @count.to_s
  end

  def to_f
    @count
  end
end
