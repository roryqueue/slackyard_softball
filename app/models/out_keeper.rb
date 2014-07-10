class OutKeeper < ActiveRecord::Base
  belongs_to :batter, class_name: "Player"
  belongs_to :pitcher, class_name: "Player"
  belongs_to :game
end
