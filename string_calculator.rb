class StringCalculator
  def calculate(string_of_numbers)
    raise 'only accepts a string' unless string_of_numbers.is_a?(String)

    string_array = string_of_numbers.split(/[^0-9]+/)
    integer_array = string_array.map(&:to_i)
    integer_array.inject(0){|sum,x| sum + x }
  end

end