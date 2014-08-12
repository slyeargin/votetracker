class BillController
  def menu
    puts "Which bill would you like to view?"
    Router.navigate_bill_menu(self)
  end

  def view(bill_number)
    puts "I'm looking up #{bill_number} …"
    bill = Bill.find_by_bill_number(bill_number)
    if bill
      status = bill.passed? ? "Passed" : "Failed"
      puts "#{bill.bill_number} (#{bill.name}) - #{bill.description}  #{status} #{bill.floor_vote_date}"
    else
      puts "Sorry, there is no bill assigned that number."
    end
  end
end
