class Sponsor < ActiveRecord::Base
  belongs_to :legislators
  belongs_to :bills

end
