require_relative '../string_calculator.rb'

describe StringCalculator do

  subject(:calculator) { described_class.new }

  it 'should accept a string' do
    expect{ calculator.calculate('1,2,3') }.not_to raise_error
  end

  it 'should not accept other data types' do
    expect{ calculator.calculate(123) }.to raise_error('only accepts a string')
    expect{ calculator.calculate(['123']) }.to raise_error('only accepts a string')
  end

  it 'should return 0 for an empty string' do
    expect(calculator.calculate('')).to eq(0)
  end

  it 'should return 0 for 0 string' do
    expect(calculator.calculate('0')).to eq(0)
  end

  it 'should return a number if the passed string contains no delimiters' do
    expect(calculator.calculate('123')).to eq(123)
  end

  it 'should return the sum of the numbers in the passed string, if the passed string contains comma delimiters' do
    expect(calculator.calculate('10,15')).to eq(25)
  end

  it 'should return the sum of the numbers in the passed string, if the passed string contains new line delimiters' do
    expect(calculator.calculate("10\n15\n20")).to eq(45)
  end

  it 'should handle multiple random delimiters' do
    expect(calculator.calculate("//;\n1;2")).to eq(3)
  end

  it 'should not accept negative numbers' do
    expect{ calculator.calculate("100,-200") }.to raise_error("cannot accept negatives - -200")
  end

  it 'should ignore numbers larger than 1000' do
    expect(calculator.calculate("//;\n1;2:1001")).to eq(3)
  end

  it 'should handle random delimiters of any length' do
    expect(calculator.calculate("//[***];\n1***2***3")).to eq(6)
  end

  it 'should handle multiple delimiters' do
    expect(calculator.calculate("//[*][%];\n1*2%3")).to eq(6)
  end

  it 'should handle multiple delimiters of any length' do
    expect(calculator.calculate("//[***][%%];\n1***2%%3")).to eq(6)
  end
end