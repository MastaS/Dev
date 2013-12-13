require_relative '../spec_helper'
require_relative '../../Arrays/maximum_number_of_identical_values'

describe MaximumNumberOfIdenticalValues do
  describe "#size" do
    it 'will return 0 for an empty array' do
      expected = 0
      result = MaximumNumberOfIdenticalValues.size([])
      result.should eql(expected)
    end
  end

  describe "#size" do
    it 'will return 4 for an array with 4 of the same values' do
      expected = 4
      result = MaximumNumberOfIdenticalValues.size([1,2,1,4,4,1,4,1])
      result.should eql(expected)
    end
  end
end