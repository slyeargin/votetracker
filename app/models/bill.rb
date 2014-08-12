class Bill < ActiveRecord::Base
  has_many :bills
  has_many :sponsors, through: :bills

  validates_presence_of :bill_number, :name, :description, :floor_vote_date

  def info
    puts "#{self.bill_number} (#{self.name}) - #{self.description}  #{self.status} #{self.floor_vote_date}"
    puts "Sponsored by #{self.sponsors}"
  end

  def passed?
    yes_votes = Vote.where(["bill_number = ? and vote_status = ?", self.bill_number, "yes"])
    all_votes = Vote.where(["bill_number = ? and vote_status != ?", self.bill_number, "present"])
    tally = (yes_votes.count / all_votes.count) * 100
    tally < 50
  end

  def status
    self.passed? ? "Passed" : "Failed"
  end

  def sponsors
    sponsors = Sponsor.where(["bill_id = ?", self.id]).to_a
    sponsors.map!.with_index { |sponsor, index|
      legislator = Legislator.find_by_id(sponsor.legislator_id)
      if sponsors.size > index + 1 && sponsors.size < 2
        "#{legislator.name} (#{legislator.party_member(true)} - #{legislator.hometown}) "
      elsif sponsors.size > index + 1
        "#{legislator.name} (#{legislator.party_member(true)} - #{legislator.hometown}), "
      else
        "and #{legislator.name} (#{legislator.party_member(true)} - #{legislator.hometown})"
      end
    }
    sponsors.join
  end

  def leaning
    sponsors = Sponsor.where(["bill_id = ?", self.id]).to_a
    sponsors.map!.with_index { |sponsor, index|
      legislator = Legislator.find_by_id(sponsor.legislator_id)
      legislator.party_affiliation
    }
    democratic_count = sponsors.count("Democratic")
    republican_count = sponsors.count("Republican")
    if democratic_count == republican_count
      "Bipartisan"
    elsif democratic_count > republican_count
      "Democratic"
    else
      "Republican"
    end
  end

end
