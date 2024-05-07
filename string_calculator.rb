class StringCalculator
  def calculate(string_of_numbers)
    raise 'only accepts a string' unless string_of_numbers.is_a?(String)

    string_of_numbers.to_i
  end

end