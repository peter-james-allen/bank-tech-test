class Menu

  MENU = "Select an Option:
1. Deposit
2. Withdraw
3. View Statement
4. Exit
"
  CHOICES = [1,2,3,4]

  def display
    puts MENU
    @choice = gets.chomp.to_i
  end

  def start
    puts MENU
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "How much do you want to deposit?"
    when 2
      puts "How much do you want to withdraw?"
    when 3
      puts "You should be ok for now."
    when 4
      puts "Exiting the program"
    else
      puts "Make a choice between 1-4"
      start
    end
  end
end