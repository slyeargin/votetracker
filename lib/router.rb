class Router
  def self.navigate_start_menu(start_menu_controller)
    command = clean_gets
    case command
    when /\d+/
      start_menu_controller.view(command.to_i)
    else
      puts "Invalid input: '#{command}'"
    end
  end

  def self.navigate_bill_menu(bill_controller)
    command = clean_gets
    case command
    when /^(HB|SB)\d\d\d\d/i
      bill_controller.view(command)
    else
      puts "Invalid input: '#{command}'.  A valid example would be HB1234 or SB1234."
    end
  end

  def self.navigate_legislator_menu(legislator_controller)
    command = clean_gets
    case command
    when "list"
      legislator_controller.list
    else
      legislator_controller.view_legislator(command)
    end
  end

  def self.navigate_legislator_record_menu(legislator_controller, legislator)
    command = clean_gets

    case command
    when "1"   # voting record
      legislator_controller.get_vote_history(legislator)
    when "2"   # sponsorship success
      legislator_controller.get_sponsorship_success(legislator)
    when "3"   # bipartisanship
      legislator_controller.get_partisanship(legislator)
    when "return"
      start_menu_controller = StartMenuController.new()
      start_menu_controller.list
    when "exit"
      puts "Goodbye."
    else
      puts "Invalid input: '#{command}'."
    end
  end
end
