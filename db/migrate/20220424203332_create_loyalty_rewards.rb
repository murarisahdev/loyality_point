class CreateLoyaltyRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalty_rewards do |t|
      t.string :reward_type, null: false

      t.timestamps null: false
    end
  end
end
