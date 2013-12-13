require_relative  '../spec_helper'
require_relative '../../lib/validate_scoring'

describe ValidateScoring do
  describe "#validate" do
    it 'should return an empty array when no dice are passed in' do
      expected = []
      result = ValidateScoring.GetNonZeroScoringTypes([])
      result.should eql(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :ones given at least one dice is a 1' do
      expected = :ones
      result = ValidateScoring.GetNonZeroScoringTypes([1])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should include :twos given dice 2 is supplied' do
      expected = :twos
      result = ValidateScoring.GetNonZeroScoringTypes([2,1])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should include :threes given 3 is supplied' do
      expected = :threes
      result = ValidateScoring.GetNonZeroScoringTypes([3,2,1])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should include :fours given 4 is supplied' do
      expected = :fours
      result = ValidateScoring.GetNonZeroScoringTypes([4,3,2,1])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should include :fives given 5 is supplied' do
      expected = :fives
      result = ValidateScoring.GetNonZeroScoringTypes([5,4,3,2,1])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should include  :sixes given 6 is supplied' do
      expected = :sixes
      result = ValidateScoring.GetNonZeroScoringTypes([5,4,3,2,6])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :threeofakind given three dice with the same value' do
      result = ValidateScoring.GetNonZeroScoringTypes([1,2,2,3,2])
      result.should include(:threeofakind)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :fourofakind given four dice with the same value' do
      result = ValidateScoring.GetNonZeroScoringTypes([2,2,2,3,2])
      result.should include(:fourofakind)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :yahtzee given five dice with the same value' do
      result = ValidateScoring.GetNonZeroScoringTypes([2,2,2,2,2])
      result.should include(:yahtzee)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :smallstraight given four dice in a n+1 series' do
      expected = :smallstraight
      result = ValidateScoring.GetNonZeroScoringTypes([4,3,1,2,2])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :largestraight given five dice in a n+1 series' do
      expected = :largestraight
      result = ValidateScoring.GetNonZeroScoringTypes([4,3,1,5,2])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :fullhouse given 2 dice are identical and 3 different dice are also identical' do
      expected = :fullhouse
      result = ValidateScoring.GetNonZeroScoringTypes([2,4,2,2,4])
      result.should include(expected)
    end
  end

  describe "#GetNonZeroScoringTypes" do
    it 'should return :chance give a non sero dice is supplied' do
      expected = :chance
      result = ValidateScoring.GetNonZeroScoringTypes([1])
      result.should include(:chance)
    end
  end

end