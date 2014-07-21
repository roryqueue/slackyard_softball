class Team < ActiveRecord::Base
  validates_presence_of :name

  has_many :players, dependent: :destroy
  has_many :lineups, dependent: :destroy
  has_many :home_games, through: :lineup, source: :game
  has_many :away_games, through: :lineup, source: :game
  has_many :pitches
  has_many :runs
  belongs_to :league
  belongs_to :user

  def active_lineup
    Lineup.where(team_id: self.id).where(active: true).last
  end

  def games
    home_games = Game.where(home_team_lineup_id: Lineup.select(:id).where(team_id: self.id))
    away_games = Game.where(away_team_lineup_id: Lineup.select(:id).where(team_id: self.id))
    games = home_games + away_games
  end

  def wins
    home_games = Game.where(home_team_lineup_id: Lineup.select(:id).where(team_id: self.id))
    home_wins = 0
    home_games.each do |game|
      if game.home_score > game.away_score
        home_wins += 1
      end
    end
    away_games = Game.where(away_team_lineup_id: Lineup.select(:id).where(team_id: self.id))
    away_wins = 0
    away_games.each do |game|
      if game.away_score > game.home_score
        away_wins += 1
      end
    end
    wins = home_wins + away_wins
  end

  def losses
    home_games = Game.where(home_team_lineup_id: Lineup.select(:id).where(team_id: self.id))
    home_losses = 0
    home_games.each do |game|
      if game.home_score < game.away_score
        home_losses += 1
      end
    end
    away_games = Game.where(away_team_lineup_id: Lineup.select(:id).where(team_id: self.id))
    away_losses = 0
    away_games.each do |game|
      if game.away_score < game.home_score
        away_losses += 1
      end
    end
    losses = home_losses + away_losses
  end

  def homeruns
    StatKeeper.where(batter_id: Player.where(team_id: self.id)).where(contact_result: 'homerun').count
  end

  def triples
    StatKeeper.where(batter_id: Player.where(team_id: self.id)).where(contact_result: 'triple').count
  end

  def doubles
    StatKeeper.where(batter_id: Player.where(team_id: self.id)).where(contact_result: 'double').count
  end

  def singles
    StatKeeper.where(batter_id: Player.where(team_id: self.id)).where(contact_result: 'single').count
  end

  def rbis
    ScoreKeeper.where(batter_id: Player.where(team_id: self.id)).count
  end

  def runs_scored
    ScoreKeeper.where(scorer_id: Player.where(team_id: self.id)).count
  end

  def batting_average
    hits = self.homeruns + self.triples + self.doubles + self.singles
    outs = OutKeeper.where(batter_id: Player.where(team_id: self.id)).count
    unless outs.nil? || outs == 0
      average = (hits.to_f / (hits + outs).to_f).round(3)
    end
    if !average then average = 0 end
    average
  end

  def batting_average_formatted
    ('%.3f' % self.batting_average).sub(/^[0:]*/,"")
  end

  def era
    runs = ScoreKeeper.where(pitcher_id: Player.where(team_id: self.id)).count
    outs = OutKeeper.where(pitcher_id: Player.where(team_id: self.id)).count
    unless outs.nil? || outs == 0
      era = ((runs.to_f / outs.to_f) * 27.0).round(2)
    end
    era = 999 unless era
    era
  end

  def era_formatted
    '%.2f' % era
  end

  def strikeouts_thrown
    OutKeeper.where(pitcher_id: Player.where(team_id: self.id)).where(detail: 'strikeout').count
  end

  def batting_leaders
    self.players.sort_by { |player| if player.batting_average then player.batting_average end }.reverse!
  end

  def homerun_leaders
    self.players.sort_by { |player| player.homeruns }.reverse!
  end

  def rbi_leaders
    self.players.sort_by { |player| player.rbis }.reverse!
  end

  def era_leaders
    self.players.sort_by { |player| if player.era then player.era end }
  end

  def pitching_win_leaders
    self.players.sort_by { |player| player.wins }.reverse!
  end

  def strikeout_leaders
    self.players.sort_by { |player| player.strikeouts_thrown }.reverse!
  end

  def err_count
    StatKeeper.where(fielder_id: Player.where(team_id: self.id)).where(contact_result: ['one_base_error', 'two_base_error']).count
  end

  def field_percentage
    if StatKeeper.where(fielder_id: Player.where(team_id: self.id)).count > 0
      field_perc = (1 - (self.err_count.to_f) / StatKeeper.where(fielder_id: Player.where(team_id: self.id)).count.to_f).round(3)
    end
  end

  def field_percentage_formatted
    '%.3f' % self.field_percentage
  end

  def strength
    strength = 0.0
    self.players.each do |player|
      strength += player.batting_contact
      strength += player.batting_power
      strength += player.pitching_craftiness
      strength += ( player.pitching_accuracy.to_f / 2 )
      strength += player.fielding
      strength += ( player.speed.to_f / 2 )
    end
    ( strength / 450 ).round(2)
  end

end
