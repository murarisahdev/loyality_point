class LoyaltyReward < ApplicationRecord
  REWARD_TYPE = [
    "Free Coffee",
    "5\% Cash Rebate",
    "Movie Tickets",
    "4x Airport Lounge Access"
  ].freeze

  validates :reward_type, inclusion: { in: REWARD_TYPE }

  has_many :user_rewards, dependent: :destroy
  has_many :users, through: :user_rewards

  class << self
    def coffee_reward
      @coffee_reward ||= find_by(reward_type: "Free Coffee")
    end

    def cash_rebate
      @cash_rebate ||= find_by(reward_type: "5\% Cash Rebate")
    end

    def movie_ticket
      @movie_ticket ||= find_by(reward_type: "Movie Ticket")
    end

    def airport_lounge_access
      @airport_lounge_access ||= find_by(reward_type: "4x Airport Lounge Access")
    end
  end
end
