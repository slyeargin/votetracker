class Legislator < ActiveRecord::Base
  has_many :bills
  has_many :sponsors, through: :bills
  # has_many :votes

  validates_presence_of :name, :hometown, :district_number, :party_affiliation, :governing_body

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

  def voting_history
    votes = Vote.where(["legislator_name = ? and vote_status != ?", self.name, "Present"]).to_a
    if votes.count < 1
      "Member has not voted."
    else
      votes.map { |vote|
        bill = Bill.find_by_bill_number(vote.bill_number)
        puts "#{bill.bill_number} (#{bill.name}) - Member voted #{vote.vote_status} - #{bill.status} #{bill.floor_vote_date}"
      }
    end
  end
end
