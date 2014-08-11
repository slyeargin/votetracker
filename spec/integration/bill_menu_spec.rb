RSpec.describe "Viewing the bill menu", :integration do
  bill_number = "HB2001"
  bill_name = "The Everything Act"
  bill_description = "It does everything, but fixes nothing."
  bill_floor_vote_date = Date.strptime("3/13/2014", '%m/%d/%Y')

  let!(:bill1){ Bill.create(bill_number: bill_number, name: bill_name, description: bill_description, floor_vote_date: bill_floor_vote_date) }

  context "Choose to view bills" do
    let(:output){ run_votetracker_with_input('2') } # View bills

    it "should prompt for input" do
      expect(output).to include("Which bill would you like to view?")
    end
  end

  context "Choose to view a specific bill" do
    let(:output){ run_votetracker_with_input('2', 'HB2001') } # View bills
    it "should show the bill" do
      expected = "HB2001 (The Everything Act) - It does everything, but fixes nothing.  Passed or failed 2014-03-13"
      expect(output).to include(expected)
    end
    # it "shouldn't list any other bills" do
    #   expect(output).not_to include("with Scissors")
    #   expect(output).not_to include("like a Zombie")
    # end
  end

  context "if we enter a bill that doesn't exist" do
    let(:output){ run_votetracker_with_input('2', 'HB5000') }
    it "prints an error message" do
      expect(output).to include("Sorry, there is no bill assigned that number.")
    end
  end

  context "if we enter a invalid input" do
    let(:output){ run_votetracker_with_input('2', 'xylophone') }
    it "prints an error message" do
      expect(output).to include("Invalid input: 'xylophone'.  A valid example would be HB1234 or SB1234.")
    end
  end
end
