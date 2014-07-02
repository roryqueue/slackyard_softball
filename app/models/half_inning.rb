class HalfInning
  attr_reader :fielding_team, :batting_team, :batting_order, :pitcher, :outs, :base_path, :inning_number, :game

  attr_accessor :runs

  def initialize(game, inning_number, fielding_team, batting_team)
    @game = game
    @inning_number = inning_number
    @fielding_team = fielding_team
    @batting_team = batting_team
    @batting_order = batting_team.batting_order.rotation
    @pitcher = fielding_team.pitcher
    @outs = 0
    @runs = 0
    @base_path = BasePath.new
    play
  end

  def play
    #play succession of at bats
    at_bat = AtBat.new(game, inning_number, fielding_team, batting_team.batting_order.next!)
    update_half_inning(at_bat)
    until outs >= 3
      at_bat = AtBat.new(game, inning_number, fielding_team, batting_team.batting_order.next!)
      update_half_inning(at_bat)
    end
    runs = base_path.run_count
  end

  def update_half_inning(at_bat)
    #update for results of each at bat
    out_check(at_bat)
    if outs < 3
      update_bases(at_bat)
    end
  end

  def out_check(at_bat)
    #record any outs
    if at_bat.result == :out
      @outs += 1
    end
  end

  def update_bases(at_bat)
    #record any people on base or scored
    if at_bat.result == :single
      single(at_bat.batter)
    elsif at_bat.result == :double
      double(at_bat.batter)
    elsif at_bat.result == :triple
      triple(at_bat.batter)
    elsif at_bat.result == :homerun
      homerun(at_bat.batter)
    elsif at_bat.result == :walk
      walk(at_bat.batter)
    end
    @runs = base_path.run_count
  end


  def single(player)
    if base_path.man_on_third != nil
      man_on_home = base_path.man_on_third
      add_run(man_on_home, player)
      base_path.man_on_third = nil
    end
    if base_path.man_on_second != nil
      man_on_home = base_path.man_on_second
      add_run(man_on_home, player)
      base_path.man_on_second = nil
    end
    if base_path.man_on_first != nil
      base_path.man_on_second = base_path.man_on_first
      base_path.man_on_first = nil
    end
    base_path.man_on_first = player
  end

  def double(player)
    if base_path.man_on_third != nil
      man_on_home = base_path.man_on_third
      add_run(man_on_home, player)
      base_path.man_on_third = nil
    end
    if base_path.man_on_second != nil
      man_on_home = base_path.man_on_second
      add_run(man_on_home, player)
      base_path.man_on_second = nil
    end
    if base_path.man_on_first != nil
      man_on_home = base_path.man_on_first
      add_run(man_on_home, player)
      base_path.man_on_first = nil
    end
    base_path.man_on_second = player
  end

  def triple(player)
    if base_path.man_on_third != nil
      man_on_home = base_path.man_on_third
      add_run(man_on_home, player)
      base_path.man_on_third = nil
    end
    if base_path.man_on_second != nil
      man_on_home = base_path.man_on_second
      add_run(man_on_home, player)
      base_path.man_on_second = nil
    end
    if base_path.man_on_first != nil
      man_on_home = base_path.man_on_first
      add_run(man_on_home, player)
      base_path.man_on_first = nil
    end
    base_path.man_on_third = player
  end

  def homerun(player)
    if base_path.man_on_third != nil
      man_on_home = base_path.man_on_third
      add_run(man_on_home, player)
      base_path.man_on_third = nil
    end
    if base_path.man_on_second != nil
      man_on_home = base_path.man_on_second
      add_run(man_on_home, player)
      base_path.man_on_second = nil
    end
    if base_path.man_on_first != nil
      man_on_home = base_path.man_on_first
      add_run(man_on_home, player)
      base_path.man_on_first = nil
    end
    man_on_home = player
    add_run(man_on_home, player)
  end

  def walk(player)
    if base_path.man_on_third != nil && base_path.man_on_second != nil && base_path.man_on_first != nil
      add_run(man_on_home, player)
      base_path.man_on_third = nil
    end
    if base_path.man_on_second != nil
      base_path.man_on_third = base_path.man_on_second && base_path.man_on_first != nil
      base_path.man_on_second = nil
    end
    if base_path.man_on_first != nil
      base_path.man_on_second = base_path.man_on_first
      base_path.man_on_first = nil
    end
    base_path.man_on_first = player
  end

  def add_run(scored_by, batted_in_by)
    base_path.run_count += 1
    ScoreKeeper.create(pitcher_id: pitcher, batter_id: batted_in_by.id, scorer_id: scored_by.id, hitting_team_id: batting_team.id , fielding_team_id: fielding_team.id, game_id: game.id, inning_number: inning_number)
  end

end
