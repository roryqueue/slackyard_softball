FactoryGirl.define do
  factory :lineup do
    sequence(:nickname) { |n| "Lineup #{n}"  }
    association :pitcher, factory: :player
    association :catcher, factory: :player
    association :first_baseman, factory: :player
    association :second_baseman, factory: :player
    association :third_baseman, factory: :player
    association :shortstop, factory: :player
    association :left_fielder, factory: :player
    association :center_fielder, factory: :player
    association :right_fielder, factory: :player
    association :first_up, factory: :player
    association :second_up, factory: :player
    association :third_up, factory: :player
    association :fourth_up, factory: :player
    association :fifth_up, factory: :player
    association :sixth_up, factory: :player
    association :seventh_up, factory: :player
    association :eighth_up, factory: :player
    association :ninth_up, factory: :player

    team
  end
end
