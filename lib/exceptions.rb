# frozen_string_literal: true

# New error to capture incorrectly formatted input
class InputFormatError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Error: You must input a number with maximum of 2 decimal places'
    super(msg)
  end
end
