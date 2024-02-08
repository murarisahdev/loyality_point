class Flag < ApplicationRecord
  LABELS = %w(
    coffee_reward
    cash_rebate_awarded
    airport_lounge_access
    movie_ticket_awarded
  ).freeze

  belongs_to :user

  validates :type, inclusion: { in: LABELS }

  def self.flag(user, label)
    return if Flag.flagged?(user, label)

    Flag.create(user_id: user.id, type: label.to_s)
  end

  def self.flagged?(user, label)
    Flag.where(user_id: user.id, type: label.to_s).exists?
  end
end
