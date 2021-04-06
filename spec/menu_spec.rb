require 'menu'
require 'stringio'

MENU = "Select an Option:
1. Deposit
2. Withdraw
3. View Statement
4. Exit
"

describe Menu do
  before do
    $stdin = StringIO.new("1\r")
  end

  after do
    $stdin = STDIN
  end

  it 'should give the user 4 options' do
    expect { subject.display }.to output(MENU).to_stdout
  end

  context 'depositing' do
    before do
      $stdin = StringIO.new("1\r")
    end
  
    after do
      $stdin = STDIN
    end

    it 'should diplay the deposit message' do
      expect { subject.start }.to output(MENU + "How much do you want to deposit?\n").to_stdout
    end
  end

  context 'withdrawing' do
    before do
      $stdin = StringIO.new("2\r")
    end
  
    after do
      $stdin = STDIN
    end

    it 'should diplay the withdraw message' do
      expect { subject.start }.to output(MENU + "How much do you want to withdraw?\n").to_stdout
    end
  end

  context 'exiting' do
    before do
      $stdin = StringIO.new("4\r")
    end
  
    after do
      $stdin = STDIN
    end

    it 'should diplay the exit message' do
      expect { subject.start }.to output(MENU + "Exiting the program\n").to_stdout
    end
  end
end