require "rails_helper"

RSpec.describe LoyaltyPoint, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:point) }
end
