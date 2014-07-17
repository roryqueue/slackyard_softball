class StatKeeper < ActiveRecord::Base
  belongs_to :game
  belongs_to :batting_team, class_name: "Team"
  belongs_to :fielding_team, class_name: "Team"
  belongs_to :batter, class_name: "Player"
  belongs_to :pitcher, class_name: "Player"
  belongs_to :fielder, class_name: "Player"
end
