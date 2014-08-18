RSpec.describe "Viewing the legislator menu", :integration do

  let!(:elected1){ Legislator.create(name: "Olivia Jenkins", hometown: "Chattanooga", district_number: "1", party_affiliation: "Democratic", governing_body: "Senate") }
  let!(:elected2){ Legislator.create(name: "Berk Johns", hometown: "Memphis", district_number: "3", party_affiliation: "Democratic", governing_body: "Senate")
  }
  let!(:elected3){ Legislator.create(name: "Yuri Hamilton", hometown: "Smyrna", district_number: "4", party_affiliation: "Republican", governing_body: "Senate")
 }
 let!(:elected4){ Legislator.create(name: "Alyssa Miles", hometown: "Knoxville", district_number: "7", party_affiliation: "Republican", governing_body: "Senate")
}
  let!(:elected5){ Legislator.create(name: "Myra Henderson", hometown: "Memphis", district_number: "2", party_affiliation: "Democratic", governing_body: "Senate")}

 let!(:bill1){ Bill.create(bill_number: "SB1234", name: "Wine in Grocery Stores", description: "Because it makes sense.", floor_vote_date: Date.strptime('3/17/2014', '%m/%d/%Y'))}
 let!(:bill2){ Bill.create(bill_number: "SB1235", name: "Nashville Has to Ask", description: "Nashville has to get permission first for everything.", floor_vote_date: Date.strptime('3/18/2014', '%m/%d/%Y'))}

 let!(:vote1){ Vote.create(bill_number: "SB1234", legislator_name: "Olivia Jenkins", vote_status: "yes") }
 let!(:vote2){ Vote.create(bill_number: "SB1235", legislator_name: "Olivia Jenkins", vote_status: "no") }
 let!(:vote3){ Vote.create(bill_number: "SB1235", legislator_name: "Berk Johns", vote_status: "yes") }
 let!(:vote4){ Vote.create(bill_number: "SB1235", legislator_name: "Yuri Hamilton", vote_status: "yes") }
 # let!(:vote5){ Vote.create(bill_number: "SB1234", legislator_name: "Alyssa Miles", vote_status: "yes") }

  context "Choose to view a legislator's record" do
    let(:output){ run_votetracker_with_input('1') } # View legislators

    it "should prompt for input" do
      expect(output).to include("Which legislator's record would you like to view?")
    end
  end

  context "Choose to view a list" do
    let(:output){ run_votetracker_with_input('1', 'list') } # View list
    it "should show a list" do
      expected = "\n==============\nLegislators\n==============\n1. Olivia Jenkins - Senate\n2. Berk Johns - Senate\n3. Yuri Hamilton - Senate\n"
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

  context "Choose to view a legislator's voting record" do
    let(:output){ run_votetracker_with_input('1', 'Olivia Jenkins', '1') } # View legislator
    it "should show a specific legislator's voting record" do
      expected1 = "Would you like to view this legislator's …\n1. Voting record\n2. Bill sponsorship success rate\n3. Partisanship rating\nYou can also (return) to the start menu or (exit) the program."
      expected2 = "==============\nOlivia Jenkins (D - Chattanooga) - Voting History\nSB1234 (Wine in Grocery Stores) - Member voted yes - Passed 2014-03-17\nSB1235 (Nashville Has to Ask) - Member voted no - Passed 2014-03-18\n=============="
      expect(output).to include(expected1)
      expect(output).to include(expected2)
    end
  end

# let!(:sponsor1){ Sponsor.create(bill_id: bill1.id, legislator_id: elected1.id)}
# let!(:sponsor2){ Sponsor.create(bill_id: bill1.id, legislator_id: elected4.id)}
# let!(:sponsor3){ Sponsor.create(bill_id: bill1.id, legislator_id: elected5.id)}
# let!(:sponsor4){ Sponsor.create(bill_id: bill1.id, legislator_id: elected2.id)}
# let!(:sponsor5){ Sponsor.create(bill_id: bill2.id, legislator_id: elected3.id)}
end
