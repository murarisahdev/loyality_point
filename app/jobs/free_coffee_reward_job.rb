class FreeCoffeeRewardJob < ApplicationJob
  queue_as :default

  def perform
    date_range = Date.today.beginning_of_month..Date.today.end_of_month

    applicable_users = User
      .left_outer_joins(:loyalty_points)
      .where(created_at: date_range)
      .group("users.id")
      .having("SUM(loyalty_points.point) >= ?", 100)

    applicable_users.find_each { |user| user.reward_user("coffee_reward") }
  end
end
