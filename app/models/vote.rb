class Vote < ActiveRecord::Base
  # belongs_to :legislators
  # belongs_to :bills

  validates_presence_of :bill_number, :legislator_name, :vote_status

end
