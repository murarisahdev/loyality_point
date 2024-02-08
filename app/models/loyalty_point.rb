class LoyaltyPoint < ApplicationRecord
  belongs_to :user

  validates :point, presence: true

  default_scope -> { where(is_expired: false) }

  def self.user_points(user)
    where(user_id: user.id).sum(:point)
  end
end
