class Bill < ActiveRecord::Base
  # have_many :sponsor
  # has_many :votes
  # has_many :legislators, through: :votes

  validates_presence_of :bill_number, :name, :description, :floor_vote_date

  def passed?
    yes_votes = Vote.where(["bill_number = ? and vote_status = ?", self.bill_number, "yes"])
    all_votes = Vote.where(["bill_number = ? and vote_status != ?", self.bill_number, "present"])
    tally = (yes_votes.count / all_votes.count) * 100
    tally < 50
  end
end
