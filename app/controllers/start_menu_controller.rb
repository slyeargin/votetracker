class StartMenuController
  def list
    puts "=============="
    puts "GET STARTED"
    puts "=============="
    puts "1.  View a legislator's record"
    puts "2.  View bills"
    Router.navigate_start_menu(self)
  end

  def view(path_number)
    if path_number == 1
      legislator_controller = LegislatorController.new()
    elsif path_number == 2
      bill_controller = BillController.new()
      bill_controller.menu
    else
      puts "#{path_number} isn't a valid option."
    end
  end
end
