class BillController
  def menu
    puts "Which bill would you like to view?"
    Router.navigate_bill_menu(self)
  end

  def view(bill_number)
    bill = Bill.find_by_bill_number(bill_number)
    if bill
      puts "#{bill.bill_number} (#{bill.name}) - #{bill.description}  #{bill.status} #{bill.floor_vote_date}"
      puts "Sponsored by #{bill.sponsors}"
      puts "Bill leans #{bill.leaning}"
    else
      puts "Sorry, there is no bill assigned that number."
    end
  end
end
