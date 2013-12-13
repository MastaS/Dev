module LongestNPlusOneSeries
  def LongestNPlusOneSeries.size array
    max = 0
    if (array.size > 0)
      array = array.sort()
      count = 0
      lastValue = array[0]-1
      array.each { |value|
        if value == lastValue + 1
          count += 1
        elsif (value != lastValue)
          count = 1
        end

        lastValue = value
        max = count > max ? count : max
      }
    end
    return max
  end
end