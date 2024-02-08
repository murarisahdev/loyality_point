class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  enum tier: %i(standard gold platinum), _suffix: true

  validates :email, uniqueness: true
  validates_confirmation_of :password
  validates :dob, presence: true

  has_many :loyalty_points, dependent: :destroy
  has_many :invoices, dependent: :destroy

  has_many :user_rewards, dependent: :destroy
  has_many :loyalty_rewards, through: :user_rewards

  scope :today_birthday, -> { where("EXTRACT(month FROM dob) = ? AND EXTRACT(day FROM dob) = ?", Date.today.month, Date.today.day) }

  def reward_user(reward_type)
    user_rewards.create(loyalty_reward: LoyaltyReward.send(reward_type))
  end
end
