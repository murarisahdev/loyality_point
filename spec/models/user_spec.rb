require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:loyalty_points).dependent(:destroy) }
  it { should have_many(:invoices).dependent(:destroy) }
  it { should have_many(:user_rewards).dependent(:destroy) }
  it { should have_many(:loyalty_rewards) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:dob) }
end
