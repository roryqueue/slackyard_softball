class ScoreKeeper < ActiveRecord::Base
  belongs_to :game
  belongs_to :hitting_team, class_name: "Team"
  belongs_to :fielding_team, class_name: "Team"
  belongs_to :scorer, class_name: "Player"
  belongs_to :hitter, class_name: "Player"
  belongs_to :pitcher, class_name: "Player"
end
