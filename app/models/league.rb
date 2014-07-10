class League < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :commissioner_id

  has_many :teams
  belongs_to :commissioner, class_name: "User"

  def standings
    teams = self.teams.all.to_a
    standings = teams.sort_by { |team| team.wins }.reverse!
  end

  def players
    Player.where(team_id: Team.select(:id).where(league_id: self.id))
  end

  def batting_leaders
    self.players.sort_by { |player| player.batting_average }.reverse!
  end

  def homerun_leaders
    self.players.sort_by { |player| player.homeruns }.reverse!
  end

  def rbi_leaders
    self.players.sort_by { |player| player.rbis }.reverse!
  end

  def era_leaders
    self.players.sort_by { |player| player.era }
  end

  def pitching_win_leaders
    self.players.sort_by { |player| player.wins }.reverse!
  end

  def strikeout_leaders
    self.players.sort_by { |player| player.strikeouts_thrown }.reverse!
  end
end
