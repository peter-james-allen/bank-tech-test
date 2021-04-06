require 'account'

describe Account do

  it 'should have a balance of zero by default' do
    expect(subject.balance).to eq 0
  end

  it 'should be able to make a deposit' do
    subject.deposit(10)
    expect(subject.balance).to eq 10
  end

  it 'should be able to make a withdrawal' do
    subject.withdraw(10)
    expect(subject.balance).to eq -10
  end

end