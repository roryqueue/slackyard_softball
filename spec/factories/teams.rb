FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "Seattle Mariners #{n}"  }

    user
    league
  end
end
