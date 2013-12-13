require_relative  '../spec_helper'
require_relative  '../../lib/dice'

describe Dice do
  before (:each) do
    @dice = Dice.new
  end

  describe "#roll" do
    it 'will roll n dice and return an array' do
      @dice.roll(0)
      expected = []
      @dice.dice.should eql(expected)
    end
  end

  describe "#roll" do
    it 'will roll 1 dice and receive an array of length 1 and a number between 1 and 6' do
      @dice.roll(1)
      @dice.dice.size.should eql(1)
      @dice.dice[0].should >= 1 and @dice.dice[0].should be <= 6
    end
  end

  describe "#roll" do
    it 'will throw an ArgumentError exception when no parameter is passed in' do
      expect{@dice.roll}.to raise_error(ArgumentError)
    end
  end

  describe "#roll" do
    it 'will thro an ArgumentError when a negative parameter is passed in' do
      expect {@dice.roll -1}.to raise_error(ArgumentError)
    end
  end
end