# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

LoyaltyReward::REWARD_TYPE.each do |type|
  LoyaltyReward.create(reward_type: type)
end
