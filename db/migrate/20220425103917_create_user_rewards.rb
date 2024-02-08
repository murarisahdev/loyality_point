class CreateUserRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :user_rewards do |t|
      t.references :user, index: true, foreign_key: true
      t.references :loyalty_reward, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
