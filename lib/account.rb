# frozen_string_literal: true

require_relative 'exceptions'

# Account class - stores account balance and array of transactions
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def deposit(amount)
    transaction(amount)
  end

  def withdraw(amount)
    transaction(-amount)
  end

  private

  def transaction(amount)
    raise InputFormatError unless validate_input?(amount)

    @transactions.push(Transaction.new(amount, @balance))
    @balance += amount
  end

  def validate_input?(amount)
    check_int = amount.instance_of? Integer
    check_float = amount.instance_of? Float
    check_float_dp = amount.to_s.split('.').last.length <= 2

    check_int || (check_float && check_float_dp)
  end
end
