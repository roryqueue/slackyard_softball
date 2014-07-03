class Inning
  attr_reader :home_team, :away_team, :number, :home_score, :away_score, :game

  def initialize(game, inning_number, home_team, away_team)
    @game = game
    @home_team = home_team
    @away_team = away_team
    @number = inning_number
    @home_score = 0
    @away_score = 0
    play
  end

  def play
    away_bats = HalfInning.new(game, number, home_team, away_team)
    @away_score = away_bats.runs
    home_bats = HalfInning.new(game, number, away_team, home_team)
    @home_score = home_bats.runs
    puts number
  end

end
