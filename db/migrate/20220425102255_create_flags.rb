class CreateFlags < ActiveRecord::Migration[7.0]
  def change
    create_table :flags do |t|
      t.references :user, index: true, foreign_key: true
      t.string :type, null: false

      t.timestamps null: false
    end
  end
end
