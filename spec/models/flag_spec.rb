require "rails_helper"

RSpec.describe Flag, type: :model do
  it { should belong_to(:user) }

  it { should validate_inclusion_of(:type).in_array(Flag::LABELS) }
end
