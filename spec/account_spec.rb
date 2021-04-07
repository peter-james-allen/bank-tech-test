# frozen_string_literal: true

require 'account'

describe Account do
  let(:statement_class) { double :statement_class, new: statement }
  let(:statement) { double :statement, to_s: "header\n" }

  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:transaction) { double :transaction }

  let(:subject) { Account.new(statement_class: statement_class, transaction_class: transaction_class) }

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
    expect(subject.transactions.last).to eq transaction
  end

  it 'should be able to make a withdrawal' do
    subject.withdraw(10)
    expect(subject.balance).to eq(-10)
    expect(subject.transactions.length).to eq 1
    expect(subject.transactions.last).to eq transaction
  end

  it 'should print a statement' do
    expect { subject.statement }.to output.to_stdout
  end

  context 'input validation' do
    it 'should raise an error if a non integer is deposited or withdrawn' do
      expect { subject.deposit('abc') }.to raise_error InputFormatError
      expect { subject.withdraw('abc') }.to raise_error InputFormatError
    end

    it 'should raise an error if a float with more than 2dp is deposited or withdrawn' do
      expect { subject.deposit(1.001) }.to raise_error InputFormatError
      expect { subject.withdraw(1.001) }.to raise_error InputFormatError
    end
  end

  it 'should raise an error if a negative number is deposited or withdrawn' do
    expect { subject.deposit(-10) }.to raise_error InputFormatError
    expect { subject.withdraw(-10) }.to raise_error InputFormatError
  end
end
