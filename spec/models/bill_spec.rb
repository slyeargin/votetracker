RSpec.describe Bill do
  # it { should have_many :sponsors }
  # it { should have_many :votes }
  it { should validate_presence_of :bill_number }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :floor_vote_date }


end
