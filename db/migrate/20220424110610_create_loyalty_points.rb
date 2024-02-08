class CreateLoyaltyPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalty_points do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :point, null: false
      t.boolean :is_expired, default: false

      t.timestamps null: false
    end
  end
end
