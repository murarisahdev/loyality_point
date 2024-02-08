class QuaterlyBonusJob < ApplicationJob
  queue_as :default

  def perform
    beginning_of_quarter = (Date.today - 1.month).beginning_of_quarter
    end_of_quarter = (Date.today - 1.month).end_of_quarter

    applicable_users = User
      .left_outer_joins(:invoices)
      .where(invoices: { created_at: beginning_of_quarter..end_of_quarter })
      .group("users.id")
      .having("SUM(invoices.amount) > ?", 2000)

    applicable_users.find_each { |user| user.loyalty_points.create(point: 100) }
  end
end
