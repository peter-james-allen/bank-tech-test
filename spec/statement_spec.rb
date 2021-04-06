# frozen_string_literal: true

require 'statement'

describe Statement do
  # Mock transaction doubels for testing
  let(:transaction1) do
    double :transaction1, date: '01/04/2021', credit: 100.00, debit: '', start_balance: 0.00, end_balance: 100.00
  end
  let(:transaction2) do
    double :transaction2, date: '02/04/2021', credit: '', debit: -50.50, start_balance: 100.00, end_balance: 49.50
  end
  let(:transaction3) do
    double :transaction3, date: '04/04/2021', credit: '', debit: -70.00, start_balance: 49.50, end_balance: -20.50
  end
  let(:transactions) { [transaction1, transaction2, transaction3] }
  let(:subject) { Statement.new(transactions) }

  it 'should have a header' do
    expect(subject.to_s.split('\n').first).to eq 'date || credit || debit || balance'
  end
end
