FactoryBot.define do
  factory :user do
    email    { "test_user@loyalty.com" }
    password { "password" }
    password_confirmation { "password" }
    dob { Date.today }
  end
end
