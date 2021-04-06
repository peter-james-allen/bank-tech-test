class Transaction

  attr_reader :date, :amount, :start_balance, :end_balance

  def initialize(amount, start_balance)
    @amount = amount
    @start_balance = start_balance
    @end_balance = start_balance + amount
    @date = Time.now.strftime("%m/%d/%Y")
  end

end