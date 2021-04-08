require 'account'
require 'statement'
require 'transaction'

DATE = Time.now.strftime('%d/%m/%Y')

RESULT = "date || credit || debit || balance
#{DATE} ||  || 500.00 || 2500.00
#{DATE} || 2000.00 ||  || 3000.00
#{DATE} || 1000.00 ||  || 1000.00
"

# Test based on the acceptance criteria
describe 'Bank' do

  it 'should be able to create an account, deposit, withdraw and print statement' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect{ account.statement }.to output(RESULT).to_stdout
  end

end