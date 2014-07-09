class Team < ActiveRecord::Base
  validates_presence_of :name

  has_many :players
  has_many :lineups
  has_many :home_games, through: :lineup, source: :game
  has_many :away_games, through: :lineup, source: :game
  has_many :pitches
  has_many :runs

end

