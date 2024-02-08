class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :foreign_country_investment, default: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.datetime :invoice_date, null: false
      t.timestamps null: false
    end
  end
end
