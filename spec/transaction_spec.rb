require 'transaction'

describe Transaction do

  let(:subject) { Transaction.new(10) }

  it 'should have a date and amount' do
    expect(subject.date).to eq Time.now.strftime("%m/%d/%Y")
    expect(subject.amount).to eq 10
  end
end