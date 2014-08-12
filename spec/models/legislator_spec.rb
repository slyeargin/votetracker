RSpec.describe Legislator do
  it { should validate_presence_of :name }
  it { should validate_presence_of :hometown }
  it { should validate_presence_of :district_number }
  it { should validate_presence_of :party_affiliation }
  it { should validate_presence_of :governing_body }

end
