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
end