require_relative '../spec_helper'
require_relative '../../Arrays/longest_n_plus_one_series'

describe LongestNPlusOneSeries do

  describe "#size" do
    it 'will return zero for an empty array' do
      expected = 0
      result = LongestNPlusOneSeries.size []
      result.should eql(expected)
    end
  end

  describe "#size" do
    it 'will return 4 for a series 1,2,2,4,5,5,6' do
      expected = 4
      result = LongestNPlusOneSeries.size [1,2,2,4,5,5,6,7,7,7]
      result.should eql(4)
    end
  end

end
