RSpec.describe "Viewing the bill menu", :integration do

  context "Choose to view bills" do
    let(:output){ run_votetracker_with_input('2') } # View bills

    it "should prompt for input" do
      expect(output).to include("Which bill would you like to view?")
    end
  end

  context "Choose to view a specific bill" do
    let(:output){ run_votetracker_with_input('2', 'HB2000') } # View bills
    it "should show the bill" do
      expected = "poo"
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
