FactoryGirl.define do
  factory :game do
    association :home_team_lineup, factory: :lineup
    association :away_team_lineup, factory: :lineup
  end
end
