require 'rails_helper'

RSpec.describe Pet, type: :model do
  
  # Validates presence of attributes
  it { is_expected.to validate_presence_of(:breed) }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:owner) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_presence_of(:last_consultation) }
  it { is_expected.to validate_presence_of(:birthday) }

end
