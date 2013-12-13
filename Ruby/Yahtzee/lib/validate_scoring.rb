require_relative '../Common/Arrays/longest_n_plus_one_series'
require_relative '../Common/Arrays/maximum_number_of_identical_values'

module ValidateScoring
  def ValidateScoring.GetNonZeroScoringTypes(dice)
    nonZeroScores = []
    if (dice.size > 0)
      nonZeroScores.push(:chance)

      dice = dice.sort()
      HasDiceValue(dice, 1) ? nonZeroScores.push(:ones) : nil
      HasDiceValue(dice, 2) ? nonZeroScores.push(:twos) : nil
      HasDiceValue(dice, 3) ? nonZeroScores.push(:threes) : nil
      HasDiceValue(dice, 4) ? nonZeroScores.push(:fours) : nil
      HasDiceValue(dice, 5) ? nonZeroScores.push(:fives) : nil
      HasDiceValue(dice, 6) ? nonZeroScores.push(:sixes) : nil

      largestSetOfIdenticalDice = MaximumNumberOfIdenticalValues.size(dice)
      largestSetOfIdenticalDice >= 3 ? nonZeroScores.push(:threeofakind) : nil
      largestSetOfIdenticalDice >= 4 ? nonZeroScores.push(:fourofakind) : nil
      largestSetOfIdenticalDice >= 5 ? nonZeroScores.push(:yahtzee) : nil

      largestNplusOneSeries = LongestNPlusOneSeries.size(dice)
      largestNplusOneSeries >= 4 ? nonZeroScores.push(:smallstraight) : nil
      largestNplusOneSeries >= 5 ? nonZeroScores.push(:largestraight) : nil

      IsFullHouse(dice) ? nonZeroScores.push(:fullhouse) : nil
    end
    return nonZeroScores
  end

  def ValidateScoring.HasDiceValue(dice, value)
    dice.include?(value)
  end

  def ValidateScoring.IsFullHouse(dice)
    numberOfIdenticalSetLongerThanOne = 0
    hash = Hash.new(0)
    dice.each {|value| hash[value] += 1}

    hash.each_value { |value|
      if value > 1
        numberOfIdenticalSetLongerThanOne += 1
      end
    }
    return numberOfIdenticalSetLongerThanOne>=2
  end

end