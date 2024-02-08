module InvoicesHelper
  def user_loyalty_points
    current_user.loyalty_points.sum(&:point)
  end

  def fetch_award_recieve_text(reward)
    "You've recieved #{reward.reward_type} reward"
  end
end
