RSpec.describe "Viewing the legislator menu", :integration do

  let!(:elected1){ Legislator.create(name: "Olivia Jenkins", hometown: "Chattanooga", district_number: "1", party_affiliation: "Democratic", governing_body: "Senate") }
  let!(:elected2){ Legislator.create(name: "Berk Johns", hometown: "Memphis", district_number: "3", party_affiliation: "Democratic", governing_body: "Senate")
  }
  let!(:elected3){ Legislator.create(name: "Yuri Hamilton", hometown: "Smyrna", district_number: "4", party_affiliation: "Republican", governing_body: "Senate")
 }

  context "Choose to view a legislator's record" do
    let(:output){ run_votetracker_with_input('1') } # View legislators

    it "should prompt for input" do
      expect(output).to include("Which legislator's record would you like to view?")
    end
  end

  context "Choose to view a list" do
    let(:output){ run_votetracker_with_input('1', 'list') } # View list
    it "should show a list" do
      expected = "\n==============\nLegislators\n==============\n1. Olivia Jenkins\n2. Berk Johns\n3. Yuri Hamilton\n"
      expect(output).to include(expected)
    end
  end

  context "Choose to view a legislator" do
    let(:output){ run_votetracker_with_input('1', 'Olivia Jenkins') } # View legislator
    it "should show a specific legislator" do
      expected = "Senator Olivia Jenkins is a Democrat from Chattanooga (Senate District 1)."
      expect(output).to include(expected)
    end
  end

  context "if we enter a name that doesn't exist" do
    let(:output){ run_votetracker_with_input('1', 'Pookie') }
    it "prints an error message" do
      expect(output).to include("There's no legislator with that name.")
    end
  end

  context "if we enter a number that doesn't correspond to a listed legislator" do
    let(:output){ run_votetracker_with_input('1', 'list', '6') }
    it "prints an error message" do
      expect(output).to include("Invalid entry.")
    end
  end

end
