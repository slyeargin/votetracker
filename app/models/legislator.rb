class Legislator < ActiveRecord::Base
  has_many :bills
  has_many :sponsors, through: :bills

  validates_presence_of :name, :hometown, :district_number, :party_affiliation, :governing_body

  def info
    "#{self.honorific} #{self.name} is a #{self.party_member} from #{self.hometown} (#{self.governing_body} District #{self.district_number})."
  end

  def honorific
    (self.governing_body == "House") ? "Representative" : "Senator"
  end

  def party_member(short_format=false)
    if short_format
      party_member = (self.party_affiliation == "Democratic") ? "D" : "R"
    else
      party_member = (self.party_affiliation == "Democratic") ? "Democrat" : self.party_affiliation
    end
  end

  def partisanship
    votes = Vote.where(["legislator_name = ? and vote_status != ?", self.name, "Present"]).to_a
    if votes.count < 1
      "#{self.name} has not voted."
    else
      cross_count = 0
      puts "#{self.name} (#{self.party_member(true)} - #{self.hometown}) - Partisanship Rating"
      votes.map { |vote|
        bill = Bill.find_by_bill_number(vote.bill_number)
        puts "#{bill.bill_number} (#{bill.name}) - Bill leans #{bill.leaning} - #{bill.status} #{bill.floor_vote_date}"
        if bill.leaning != self.party_affiliation
          cross_count += 1
        end
      }
      rate = 100 - ((cross_count.to_f / votes.count.to_f) * 100)
      puts "Member has a #{rate.to_i}% partisanship rating."
    end
  end

  def success_rate
    bills_sponsored = Sponsor.where(["legislator_id = ?", self.id]).to_a
    if bills_sponsored.count < 1
      "#{self.name} has not sponsored any bills."
    else
      passed_count = 0
      puts "#{self.name} (#{self.party_member(true)} - #{self.hometown}) - Sponsorship Success Rate"
      bills_sponsored.map { |bs|
        bill = Bill.find_by_id(bs.bill_id)
        puts "#{bill.bill_number} (#{bill.name}) - Bill leans #{bill.leaning} - #{bill.status} #{bill.floor_vote_date}"
        if bill.status == "Passed"
          passed_count += 1
        end
      }
      rate = (passed_count / bills_sponsored.count) * 100
      puts "Member has a #{rate}% success rate."
    end
  end

  def voting_history
    votes = Vote.where(["legislator_name = ? and vote_status != ?", self.name, "Present"]).to_a
    if votes.count < 1
      "#{self.name} has not voted."
    else
      puts "=============="
      puts "#{self.name} (#{self.party_member(true)} - #{self.hometown}) - Voting History"
      votes.map { |vote|
        bill = Bill.find_by_bill_number(vote.bill_number)
        puts "#{bill.bill_number} (#{bill.name}) - Member voted #{vote.vote_status} - #{bill.status} #{bill.floor_vote_date}"
      }
    end
  end

end
