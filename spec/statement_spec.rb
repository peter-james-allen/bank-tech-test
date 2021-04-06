require 'statement'

describe Statement do

    # Mock transaction doubels for testing
    let(:transaction_1) { double :transaction_1, date: '01/04/2021', amount: 100.00, start_balance: 0.00, end_balance: 100.00 }
    let(:transaction_2) { double :transaction_2, date: '02/04/2021', amount: -50.50, start_balance: 100.00, end_balance: 49.50 }
    let(:transaction_3) { double :transaction_3, date: '04/04/2021', amount: -70.00, start_balance: 49.50, end_balance: -20.50 }
    let(:transactions) { [ transaction_1, transaction_2, transaction_3 ] }
    let(:subject) { Statement.new(transactions) }

    it 'should have a header' do
      expect(subject.to_s.split('\n').first).to eq 'date || credit || debit || balance'
    end

end