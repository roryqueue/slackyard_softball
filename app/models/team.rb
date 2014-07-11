class Team < ActiveRecord::Base
  validates_presence_of :name, :league_id, :user_id

  has_many :players
  has_many :lineups
  has_many :home_games, through: :lineup, source: :game
  has_many :away_games, through: :lineup, source: :game
  has_many :pitches
  has_many :runs
  belongs_to :league
  belongs_to :user

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
  end

  def era
    runs = ScoreKeeper.where(pitcher_id: Player.where(team_id: self.id)).count
    outs = OutKeeper.where(pitcher_id: Player.where(team_id: self.id)).count
    unless outs.nil? || outs == 0
      era = runs.to_f / (outs * 27).to_f.round(2)
    end
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

  def errors
    StatKeeper.where(fielder_id: Player.where(team_id: self.id)).where(contact_result: ['one_base_error', 'two_base_error']).count
  end

  def field_percentage
    self.errors.to_f / StatKeeper.where(fielder_id: Player.where(team_id: self.id)).count.to_f
  end
end

