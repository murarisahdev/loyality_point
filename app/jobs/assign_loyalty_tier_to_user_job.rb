class AssignLoyaltyTierToUserJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      first_cycle = Date.today - 2.month
      second_cycle = Date.today - 1.month

      maximun_point = [
        get_points_in_cycle(user, first_cycle),
        get_points_in_cycle(user, second_cycle)
      ].max

      update_user_tier(user, maximun_point)
    end
  end

  private

  def user_loyalty_points(user)
    @user_loyalty_points ||= user.loyalty_points
  end

  def get_points_in_cycle(user, month)
    user_loyalty_points(user)
      .where(created_at: month.beginning_of_month..month.end_of_month)
      .sum(:point)
  end

  def update_user_tier(user, points)
    if !user.platinum_tier? && points >= 5000
      user.platinum_tier!
    elsif !user.gold_tier? && points >= 1000
      user.gold_tier!

      user.reward_user("airport_lounge_access") unless Flag.flagged?(user, "airport_lounge_access")
    elsif !user.standard_tier?
      user.standard_tier!
    end
  end
end
