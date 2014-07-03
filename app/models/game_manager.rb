class GameManager
  attr_accessor :home_team, :away_team, :home_score, :away_score, :inning_number, :game

  def initialize(home_team_lineup, away_team_lineup)
    @game = Game.create(home_team_lineup: Lineup.find(home_team_lineup.id), away_team_lineup: Lineup.find(away_team_lineup.id), home_score: 0, away_score: 0)
    @home_team = TeamManager.new(home_team_lineup)
    @away_team = TeamManager.new(away_team_lineup)
    @home_score = 0
    @away_score = 0
    @inning_number = 1
    play
  end

  def play
    9.times do
      play_inning(game, inning_number, home_team, away_team)
    end
    until home_score != away_score
      play_inning(game, inning_number, home_team, away_team)
    end
    game.home_score = home_score
    game.away_score = away_score
    game.save!
  end

  def play_inning(game, inning_number, home_team, away_team)
    inning = Inning.new(game, inning_number, home_team, away_team)
    @away_score += inning.away_score
    @home_score += inning.home_score
    @inning_number += 1
  end
end
