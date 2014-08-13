class Sponsor < ActiveRecord::Base
  validates_presence_of :bill_id, :legislator_id, :vote_status

end
