require_relative '../string_calculator.rb'

describe StringCalculator do

  subject(:calculator) { described_class.new }

  it 'should accept a string' do
    expect{ calculator.calculate('1,2,3') }.not_to raise_error
  end
end