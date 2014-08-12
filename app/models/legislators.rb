class Legislator < ActiveRecord::Base
  # have_many :sponsor
  # have_many :votes

  validates_presence_of :name, :hometown, :district_number, :party_affiliation

  # def mastered?
  #   achievement.present? && achievement.mastered?
  # end
end
