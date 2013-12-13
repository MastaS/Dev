module MaximumNumberOfIdenticalValues
  def MaximumNumberOfIdenticalValues.size array
    largestSetOfIdenticalDice = 0

    array = array.sort()
    count = 0
    lastValue = ""
    array.each { |value|
      if value == lastValue
        count += 1
      else
        count = 1
        lastValue = value
      end
      largestSetOfIdenticalDice = count > largestSetOfIdenticalDice ? count : largestSetOfIdenticalDice
    }
    return largestSetOfIdenticalDice
  end
end