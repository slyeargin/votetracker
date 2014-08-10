class Bill < ActiveRecord::Base
  # have_many :sponsor
  # have_many :votes

  validates_presence_of :bill_number, :name, :floor_vote_date

  # def mastered?
  #   achievement.present? && achievement.mastered?
  # end
end
