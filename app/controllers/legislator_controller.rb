class LegislatorController
  def menu
    puts "Which legislator's record would you like to view?  (Enter 'list' for a list.)"
    Router.navigate_legislator_menu(self)
  end

  def view_legislator(legislator_input)
    case legislator_input
    when /\d+/
      legislator = legislators[legislator_input.to_i - 1]
      input_type = "number"
    else
      legislator = Legislator.find_by_name(legislator_input)
      input_type = "name"
    end

    if legislator
      puts legislator.info
      self.view_legislator_record(legislator)
    else
      message = (input_type == "number") ? "Invalid entry." : "There's no legislator with that name."
      puts message
    end
  end

  def view_legislator_record(legislator)
    puts "Would you like to view this legislator's …"
    puts "1. Voting record"
    puts "2. Bill sponsorship success rate"
    puts "3. Partisanship rating"
    puts "You can also (return) to the start menu or (exit) the program."
    Router.navigate_legislator_record_menu(self, legislator)
  end

  def list
    puts "=============="
    puts "Legislators"
    puts "=============="
    legislators.each_with_index do |legislator, index|
      puts "#{index + 1}. #{legislator.name} - #{legislator.governing_body}"
    end
    puts "Which legislator's record would you like to view?"
    Router.navigate_legislator_menu(self)
  end

  def get_vote_history(legislator)
    legislator.voting_history
    puts "=============="
    self.view_legislator_record(legislator)
  end

  def get_sponsorship_success(legislator)
    legislator.success_rate
    puts "=============="
    self.view_legislator_record(legislator)
  end

  def get_partisanship(legislator)
    legislator.partisanship
    puts "=============="
    self.view_legislator_record(legislator)
  end

  private

  def legislators
    @legislators ||= Legislator.all
  end


end
