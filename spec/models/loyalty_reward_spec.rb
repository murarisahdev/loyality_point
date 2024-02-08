require "rails_helper"

RSpec.describe LoyaltyReward, type: :model do
  it { should have_many(:users) }
  it { should have_many(:user_rewards).dependent(:destroy) }

  it { should validate_inclusion_of(:reward_type).in_array(LoyaltyReward::REWARD_TYPE) }
end
