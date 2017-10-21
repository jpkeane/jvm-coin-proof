require_relative 'result_counter'

class ResultSet
  def initialize
    @t = ResultCounter.new('T')
    @h = ResultCounter.new('H')
    @f = ResultCounter.new('Foul')
    @c = 0.0
  end

  def increment(side)
    if side == 'T'
      @t.increment
    elsif side == 'H'
      @h.increment
    else
      @f.increment
    end

    @c += 1
  end

  def count
    @c.to_i
  end

  def result(side)
    if side == 'T'
      @t
    elsif side == 'H'
      @h
    else
      @f
    end
  end

  def side_percentage(side)
    if side == 'T'
      (@t.to_f / valid_attempts) * 100
    elsif side == 'H'
      (@h.to_f / valid_attempts) * 100
    end
  end

  def valid_percentage
    100 * (1 - (@f.to_f / @c))
  end

  def invalid_percentage
    100 * (@f.to_f / @c)
  end

  def valid_attempts
    @c - @f.to_f
  end
end
