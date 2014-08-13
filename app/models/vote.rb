class Vote < ActiveRecord::Base

  validates_presence_of :bill_number, :legislator_name, :vote_status

end
