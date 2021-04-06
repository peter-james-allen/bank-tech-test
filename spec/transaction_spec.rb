# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:subject) { Transaction.new(10, 0) }

  it 'should have a date and amount' do
    expect(subject.date).to eq Time.now.strftime('%d/%m/%Y')
    expect(subject.amount).to eq 10
  end

  context 'making a deposit' do
    let(:subject) { Transaction.new(10, 0) }

    it 'should have a start and end balance' do
      expect(subject.start_balance).to eq 0
      expect(subject.end_balance).to eq 10
    end
  end

  context 'making a withdrawal' do
    let(:subject) { Transaction.new(-10, 0) }
    it 'should have a start and end balance' do
      expect(subject.start_balance).to eq 0
      expect(subject.end_balance).to eq(-10)
    end
  end
end
