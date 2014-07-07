FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "User #{n}" }
    sequence(:email) { |n| "#{n}@example.com" }
    password "password11!"
    password_confirmation "password11!"
  end
end
