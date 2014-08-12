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
end
