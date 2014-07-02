class Game < ActiveRecord::Base
  validates_presence_of :home_team_lineup, :away_team_lineup

  belongs_to :home_team_lineup, class_name: "Lineup"
  belongs_to :away_team_lineup, class_name: "Lineup"
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :pitches
  has_many :runs
end
