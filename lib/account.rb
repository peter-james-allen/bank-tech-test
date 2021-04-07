# frozen_string_literal: true

require_relative 'exceptions'

# Account class - stores account balance and array of transactions
class Account
  attr_reader :transactions

  def initialize(statement_class: Statement, transaction_class: Transaction)
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

  def balance
    @transactions.empty? ? balance = 0.0 : balance = @transactions.last.end_balance
  end

  private

  def transaction(amount)
    @transactions << @transaction_class.new(amount, balance)
  end

  def validate_input?(amount)
    check_int = amount.instance_of? Integer
    check_float = amount.instance_of? Float
    check_float_dp = amount.to_s.split('.').last.length <= 2
    check_sign = amount.to_f.positive?

    check_sign && (check_int || (check_float && check_float_dp))
  end
end
