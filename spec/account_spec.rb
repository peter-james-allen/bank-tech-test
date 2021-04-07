# frozen_string_literal: true

require 'account'

describe Account do
  it 'should have a balance of zero by default' do
    expect(subject.balance).to eq 0
  end

  it 'should have a transaction list (zero by default)' do
    expect(subject.transactions).to eq []
  end

  it 'should be able to make a deposit' do
    subject.deposit(10)
    expect(subject.balance).to eq 10
    expect(subject.transactions.length).to eq 1
    expect(subject.transactions.last).to be_a Transaction
  end

  it 'should be able to make a withdrawal' do
    subject.withdraw(10)
    expect(subject.balance).to eq(-10)
  end

  # Validate inputs
  context 'should only take a integer or 2dp float as input' do
    it 'should raise an error if a string is deposited or withdrawn' do
      expect { subject.deposit('abc') }.to raise_error InputFormatError
      expect { subject.withdraw('abc') }.to raise_error InputFormatError
    end

    it 'should raise an error if a float with more than 2dp is deposited or withdrawn' do
      expect { subject.deposit(1.001) }.to raise_error InputFormatError
      expect { subject.withdraw(1.001) }.to raise_error InputFormatError
    end
  end
end
