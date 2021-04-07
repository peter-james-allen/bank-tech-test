# frozen_string_literal: true

require_relative 'exceptions'

# Account class - stores account balance and array of transactions
class Account
  attr_reader :balance, :transactions

  def initialize(statement_class: Statement, transaction_class: Transaction)
    @balance = 0.00
    @transactions = []
    @statement_class = statement_class
    @transaction_class = transaction_class
  end

  def deposit(amount)
    raise InputFormatError unless validate_input?(amount)

    transaction(amount)
  end

  def withdraw(amount)
    raise InputFormatError unless validate_input?(amount)

    transaction(-amount)
  end

  def statement
    puts @statement_class.to_screen(@transactions)
  end

  private

  def transaction(amount)
    @transactions << @transaction_class.new(amount, @balance)
    @balance += amount
  end

  def validate_input?(amount)
    # Check if input is an integer
    check_int = amount.instance_of? Integer
    # Check if input is an float
    check_float = amount.instance_of? Float
    # Check if input has more than 2 decimal places
    check_float_dp = amount.to_s.split('.').last.length <= 2
    # Check if input is positive
    check_sign = amount.to_f > 0

    check_sign && (check_int || (check_float && check_float_dp))
  end
end
