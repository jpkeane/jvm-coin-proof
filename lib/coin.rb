class Coin
  class << self
    def flip(bias)
      flip = rand(bias)
      flip.zero? ? 'T' : 'H'
    end
  end
end
