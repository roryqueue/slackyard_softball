class Game < ActiveRecord::Base
  validates_presence_of :home_team_lineup, :away_team_lineup

  belongs_to :home_team_lineup, class_name: "Lineup"
  belongs_to :away_team_lineup, class_name: "Lineup"
  has_many :pitches
  has_many :runs
  has_many :score_keepers, dependent: :destroy
  has_many :stat_keepers, dependent: :destroy
  has_many :out_keepers, dependent: :destroy
end
