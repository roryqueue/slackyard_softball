class Season
  attr_reader :league, :teams, :champion

  def initialize(league)
    @league = league
    @teams = league.teams.to_a
    @champion = play_season
  end

  def play_season
    play_regular_season
    playoff_teams = league.standings.first(4)
    playoffs(playoff_teams[0], playoff_teams[1], playoff_teams[2], playoff_teams[3])
  end

  def play_regular_season
    round_robin.each do |week|
      week.each do |matchup|
        series(matchup[0], matchup[1], 3)
      end
    end
  end

  def playoffs(first_place, second_place, third_place, fourth_place)
    play_game(play_game(first_place, fourth_place), play_game(second_place, third_place))
  end

  def play_game(team_one, team_two)
    GameManager.create(Lineup.where(team: team_one).where(active: true),
      Lineup.where(team: team_two).where(active: true))
    game = Game.order("created_at DESC").last
    if game.home_score > game.away_score
      game home_team_lineup.team
    else
      game away_team_lineup.team
    end
  end

  def series(team_one, team_two, number_of_games)
    number_of_games.times do
      play_game(team_one, team_two)
    end
  end

  def round_robin
    rounds = []
    if teams.length % 2 != 0
      teams << nil
    end
    num_matches = teams.length / 2
    num_rounds = teams.length - 1
    i = 0
    while i < num_rounds
      matches = []
      j = 0
      while j < num_matches
        matches << [teams[j], teams[j + num_matches]].compact
        j += 1
      end
      rounds << matches
      first = teams.shift
      last = teams.pop
      teams.unshift(last)
      teams.unshift(first)
      i += 1
    end
    rounds
  end

end
