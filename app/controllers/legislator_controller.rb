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
      puts "#{legislator.honorific} #{legislator.name} is a #{legislator.party_member} from #{legislator.hometown} (#{legislator.governing_body} District #{legislator.district_number})."
    else
      message = (input_type == "number") ? "Invalid entry." : "There's no legislator with that name."
      puts message
    end
  end

  def list
    puts "=============="
    puts "Legislators"
    puts "=============="
    legislators.each_with_index do |legislator, index|
      puts "#{index + 1}. #{legislator.name}"
    end
    puts "Which legislator's record would you like to view?"
    Router.navigate_legislator_menu(self)
  end

  private

  def legislators
    @legislators ||= Legislator.all
  end


end
