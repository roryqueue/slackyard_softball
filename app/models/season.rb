class Season
  attr_reader :league, :teams, :active_lineups, :champion

  def initialize(league)
    @league = league
    @teams = league.teams.to_a
    @active_lineups = []
    @champion = play_season
  end

  def play_season
    find_active_lineups
    play_regular_season
    if teams.count >= 4
      playoff_teams = league.standings.first(4)
      winning_lineup = playoffs(playoff_teams[0].active_lineup, playoff_teams[1].active_lineup, playoff_teams[2].active_lineup, playoff_teams[3].active_lineup)
    end
    winning_lineup.team
  end

  def find_active_lineups
    teams.each do |team|
      @active_lineups << team.active_lineup
    end
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

  def play_game(lineup_one, lineup_two)
    GameManager.new(lineup_one, lineup_two)
    game = Game.order("created_at DESC").last
    if game.home_score > game.away_score
      game.home_team_lineup
    else
      game.away_team_lineup
    end
  end

  def series(team_one, team_two, number_of_games)
    number_of_games.times do
      play_game(team_one, team_two)
    end
  end

  def round_robin
    rounds = []
    if active_lineups.length % 2 != 0
      active_lineups << nil
    end
    num_matches = active_lineups.length / 2
    num_rounds = active_lineups.length - 1
    i = 0
    while i < num_rounds
      matches = []
      j = 0
      while j < num_matches
        matches << [active_lineups[j], active_lineups[j + num_matches]].compact
        j += 1
      end
      rounds << matches
      first = active_lineups.shift
      last = active_lineups.pop
      active_lineups.unshift(last)
      active_lineups.unshift(first)
      i += 1
    end
    rounds
  end

end
