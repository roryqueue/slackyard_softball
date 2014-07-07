# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :player do
    sequence(:first_name) { |n| "Ichiro #{n}"  }
    sequence(:last_name) { |n| "Suzuki #{n}"  }
    batting_contact (rand(1..100))
    batting_power (rand(1..100))
    pitching_craftiness (rand(1..100))
    pitching_accuracy (rand(1..100))
    fielding (rand(1..100))
    speed (rand(1..100))

    team
  end
end
