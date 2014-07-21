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
    @champion = winning_lineup.team
    crown_champion(champion)
  end

  def find_active_lineups
    teams.each do |team|
      if team.active_lineup
        @active_lineups << team.active_lineup
      end
    end
  end

  def play_regular_season
    2.times do
      round_robin.each do |week|
        week.each do |matchup|
          if matchup[0] && matchup[1]
            series(matchup[0], matchup[1], 3)
          end
        end
      end
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

  def series(team_one, team_two, number_of_games)
    number_of_games.times do
      play_game(team_one, team_two)
    end
  end

  def play_game(lineup_one, lineup_two)
    game = GameManager.new(lineup_one, lineup_two)
    if game.home_score > game.away_score
      game.home_team.lineup
    else
      game.away_team.lineup
    end
  end

  def playoffs(first_place, second_place, third_place, fourth_place)
    playoff_series(playoff_series(first_place, fourth_place, 5), playoff_series(second_place, third_place, 5), 5)
  end

  def playoff_series(team_one, team_two, number_of_games)
    team_one_wins = 0
    team_two_wins = 0
    until ((number_of_games.to_i + 1) / 2 == team_one_wins ) || ((number_of_games.to_i + 1) / 2 == team_two_wins )
      if play_game(team_one, team_two) == team_one
        team_one_wins += 1
      else
        team_two_wins += 1
      end
    end
    if team_one_wins > team_two_wins
      team_one
    else
      team_two
    end
  end

  def crown_champion(champion)
    new_title_count = User.find(champion.user_id).titles + 1
    User.update(champion.user_id, titles: new_title_count)
    League.update(league, champion_id: champion.id)
    champion
  end

end
