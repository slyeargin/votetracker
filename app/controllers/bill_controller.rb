class BillController
  def menu
    puts "Which bill would you like to view?"
    Router.navigate_bill_menu(self)
  end

  def view(bill_number)
    puts "I'm looking up #{bill_number} …"
    legislation = Bill.find_by_bill_number(bill_number)
    puts legislation.inspect
    status = "Passed or failed"
    if legislation.exists?
      puts legislation.bill_number
      puts legislation.name
      puts legislation.description
      puts "#{status} on #{bill.floor_vote_date}"
    else
      puts "Sorry, there is no bill assigned that number."
    end
  end
end
