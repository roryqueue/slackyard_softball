class Team < ActiveRecord::Base
  validates_presence_of :name

  has_many :players
  has_many :lineups
  has_many :games, through: :lineups
  has_many :pitches
  has_many :runs

  def games
    #need to adjust for lineup in between those two models
    Game.find(conditions: ["home_team_id = ? OR away_team_id = ?", id, id])
  end
end
