class League < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :teams, dependent: :destroy
  belongs_to :champion, class_name: "Team"
  belongs_to :commissioner, class_name: "User"

  def standings
    teams = self.teams.all.to_a
    standings = teams.sort_by { |team| team.wins }.reverse!
  end

  def players
    Player.where(team_id: Team.select(:id).where(league_id: self.id))
  end

  def games
    Game.where(home_team_lineup_id: Lineup.select(:id).where(team_id: Team.select(:id).where(league_id: self.id)))
  end

  def hit_leaders
    self.players.sort_by { |player| player.hits }.reverse!
  end

  def batting_average_leaders
    self.players.sort_by { |player| player.try(:batting_average) }.reverse!
  end

  def homerun_leaders
    self.players.sort_by { |player| player.homeruns }.reverse!
  end

  def rbi_leaders
    self.players.sort_by { |player| player.rbis }.reverse!
  end

  def era_leaders
    self.players.sort_by { |player| player.try(:era) }
  end

  def pitching_win_leaders
    self.players.sort_by { |player| player.wins }.reverse!
  end

  def strikeout_leaders
    self.players.sort_by { |player| player.strikeouts_thrown }.reverse!
  end
end
