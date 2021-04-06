# frozen_string_literal: true

# Account class
class Account
  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def deposit(amount)
    raise 'Error: You must input a number with maximum of 2 decimal places' unless validate_input?(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Error: You must input a number with maximum of 2 decimal places' unless validate_input?(amount)
    @balance -= amount
  end

  private
  def validate_input?(amount)
    check_int = amount.instance_of? Integer
    check_float = amount.instance_of? Float
    check_dp = amount.to_s.split('.').last.length <= 2

    check_int || (check_float && check_dp)
  end

end
