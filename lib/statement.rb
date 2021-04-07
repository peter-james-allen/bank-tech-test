# frozen_string_literal: true

# Statement class - formats an array of transactions for printing to the terminal with to_s method
class Statement
  attr_reader :to_s

  HEADER = "date || credit || debit || balance\n"

  def initialize(transactions)
    @transactions = transactions
    @to_s = HEADER + format_transactions
  end

  private

  def format_transactions
    '' if @transactions.empty?

    @transactions.reverse.map { |t| "#{t.date} || #{format_s(t.credit)} || #{format_s(t.debit)} || #{format_s(t.end_balance)}" }.join("\n")
  end

  def format_s(value)
    value == '' ? '' : "#{'%.2f' % value}"
  end
end
