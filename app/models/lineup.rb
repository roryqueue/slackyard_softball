class Lineup < ActiveRecord::Base
  validates_presence_of :team_id, :pitcher_id, :catcher_id, :first_baseman_id
  validates_presence_of :second_baseman_id, :third_baseman_id, :shortstop_id, :left_fielder_id
  validates_presence_of :center_fielder_id, :right_fielder_id, :first_up_id, :second_up_id, :third_up_id
  validates_presence_of :fourth_up_id, :fifth_up_id, :sixth_up_id, :seventh_up_id, :eighth_up_id, :ninth_up_id

  validates_numericality_of :team_id, :pitcher_id, :catcher_id, :first_baseman_id
  validates_numericality_of :second_baseman_id, :third_baseman_id, :shortstop_id, :left_fielder_id
  validates_numericality_of :center_fielder_id, :right_fielder_id, :first_up_id, :second_up_id, :third_up_id
  validates_numericality_of :fourth_up_id, :fifth_up_id, :sixth_up_id, :seventh_up_id, :eighth_up_id, :ninth_up_id

  belongs_to :team
  has_many :home_games, class_name: "Game", foreign_key: :home_team_lineup_id, inverse_of: :home_team_lineup
  has_many :away_games, class_name: "Game", foreign_key: :away_team_lineup_id, inverse_of: :away_team_lineup
  belongs_to :pitcher, class_name: "Player"
  belongs_to :catcher, class_name: "Player"
  belongs_to :first_baseman, class_name: "Player"
  belongs_to :second_baseman, class_name: "Player"
  belongs_to :third_baseman, class_name: "Player"
  belongs_to :shortstop, class_name: "Player"
  belongs_to :left_fielder, class_name: "Player"
  belongs_to :center_fielder, class_name: "Player"
  belongs_to :right_fielder, class_name: "Player"
  belongs_to :first_up, class_name: "Player"
  belongs_to :second_up, class_name: "Player"
  belongs_to :third_up, class_name: "Player"
  belongs_to :fourth_up, class_name: "Player"
  belongs_to :fifth_up, class_name: "Player"
  belongs_to :sixth_up, class_name: "Player"
  belongs_to :seventh_up, class_name: "Player"
  belongs_to :eighth_up, class_name: "Player"
  belongs_to :ninth_up, class_name: "Player"

  def games
    Game.find(conditions: ["home_team_lineup_id = ? OR away_team_lineup_id = ?", id, id])
  end
end
