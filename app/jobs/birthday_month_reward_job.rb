class BirthdayMonthRewardJob < ApplicationJob
  queue_as :default

  def perform
    applicable_users = User.today_birthday

    applicable_users.find_each { |user| user.reward_user("coffee_reward") }
  end
end
