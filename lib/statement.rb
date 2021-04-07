# frozen_string_literal: true

# Statement class - formats an array of transactions for printing to the terminal with to_s method
class Statement
  HEADER = "date || credit || debit || balance\n"
  def self.to_screen(transactions)
    '' if transactions.empty?

    HEADER + transactions.reverse.map do |t|
      "#{t.date} || #{Statement.format_s(t.credit)} || #{Statement.format_s(t.debit)} || #{Statement.format_s(t.end_balance)}"
    end.join("\n")
  end

  def self.format_s(value)
    value.nil? ? '' : format('%.2f', value).to_s
  end
end
