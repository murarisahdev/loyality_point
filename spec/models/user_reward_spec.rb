require "rails_helper"

RSpec.describe UserReward, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:loyalty_reward) }
end
