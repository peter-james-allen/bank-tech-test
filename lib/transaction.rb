class Transaction

  attr_reader :date, :amount

  def initialize(amount)
    @amount = amount
    @date = Time.now.strftime("%m/%d/%Y")
  end

end