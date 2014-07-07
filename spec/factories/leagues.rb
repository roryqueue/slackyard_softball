# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :league do
    sequence(:name) { |n| "American League #{n}"  }

    association :commissioner, factory: :user
  end
end
