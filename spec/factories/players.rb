# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :player do
    sequence(:first_name) { |n| "Ichiro #{n}"  }
    sequence(:last_name) { |n| "Suzuki #{n}"  }
    batting_contact 70
    batting_power 70
    pitching_craftiness 70
    pitching_accuracy 70
    fielding 70
    speed 70

    team
  end
end
