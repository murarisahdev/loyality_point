FactoryBot.define do
  factory :invoice do
    amount { 100 }
    invoice_date { Date.today }
    foreign_country_investment { false }
    association :user
  end
end
