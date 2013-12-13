class Dice
  attr_reader :dice
  def initialize
    @dice = []
  end

  def roll count
    if (count < 0)
      raise ArgumentError, "Invalid argument"
    end

    @dice = []
    if count > 0
      (1..count).each { |index|
        @dice[index-1] = rand(6) +1
      }
    end
  end
end