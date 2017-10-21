require_relative 'coin'

class FlipSet
  class << self
    def evaluate(bias)
      flip_pair = [Coin.flip(bias), Coin.flip(bias)]

      if flip_pair[0] == flip_pair[1]
        'FOUL'
      else
        flip_pair[0]
      end
    end
  end
end
