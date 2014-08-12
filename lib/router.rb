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

  # def self.navigate_training_paths_menu(training_paths_controller)
  #   command = clean_gets
  #
  #   case command
  #   when "add"
  #     training_paths_controller.add
  #   when /\d+/
  #     training_paths_controller.view(command.to_i)
  #   else
  #     puts "I don't know the '#{command}' command."
  #   end
  # end
end
