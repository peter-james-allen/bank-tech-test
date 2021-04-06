class Statement

  attr_reader :to_s

  HEADER = 'date || credit || debit || balance\n'

  def initialize(transactions)
    @transactions = transactions
    @to_s = HEADER + format_transactions
  end

  private

  def format_transactions
    ''
    # @transactions.each do
  end
end