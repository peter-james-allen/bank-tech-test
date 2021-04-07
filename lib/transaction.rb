# frozen_string_literal: true

# Transaction class - stores information about a transaction
class Transaction
  attr_reader :date, :credit, :debit, :start_balance, :end_balance

  def initialize(amount, start_balance)
    @credit = nil
    @debit = nil
    amount.negative? ? @debit = -amount : @credit = amount
    @start_balance = start_balance
    @end_balance = start_balance + amount
    @date = Time.now.strftime('%d/%m/%Y')
  end
end
