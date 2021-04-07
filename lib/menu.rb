class Menu

  MENU = "Select an Option:
1. Deposit
2. Withdraw
3. View Statement
4. Exit
"

  def initialize
    @account = Account.new
  end

  def start
    puts MENU
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "How much do you want to deposit?"
      @account.deposit(gets.chomp.to_f)
    when 2
      puts "How much do you want to withdraw?"
      @account.withdraw(gets.chomp.to_f)
    when 3
      @statement = Statement.new(@account.transactions)
      puts @statement.to_s
    when 4
      puts "Exiting the program"
      exit
    else
      puts "Make a choice between 1-4"
    end

    start
  end
end