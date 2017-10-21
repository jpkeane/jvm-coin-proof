require_relative 'result_set'
require_relative 'flip_set'

class Trial
  def initialize(steps, bias)
    @rs = ResultSet.new
    @bias = bias
    @steps = steps
    simulate
  end

  def simulate
    @steps.times do
      res = FlipSet.evaluate(@bias)
      @rs.increment(res)
    end
  end

  def output
    puts "Attempts: #{@rs.count}"
    puts "Valid Attempts: #{@rs.valid_attempts} (#{@rs.valid_percentage.round(3)}%)"
    puts "Failed Attempts: #{@rs.result('F')} (#{@rs.invalid_percentage.round(3)}%)"

    puts ''

    puts "H: #{@rs.result('H')} (#{@rs.side_percentage('H').round(3)}%)"
    puts "T: #{@rs.result('T')} (#{@rs.side_percentage('T').round(3)}%)"
  end
end
