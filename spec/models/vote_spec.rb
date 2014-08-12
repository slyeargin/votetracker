RSpec.describe Vote do
  it { should validate_presence_of :bill_number }
  it { should validate_presence_of :legislator_name }
  it { should validate_presence_of :vote_status }

end
