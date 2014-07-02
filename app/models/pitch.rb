class Pitch
  include Maths
  attr_reader :fielding_team, :pitcher, :batter, :placement, :swing, :contact, :fair_or_foul, :hit_or_fielded, :hit_type, :fielder_position, :out_or_error, :game

  def initialize(game, inning_number, fielding_team, batter)
    @game = game
    @inning_number = inning_number
    @fielding_team = fielding_team
    @pitcher = fielding_team.pitcher
    @batter = batter
    @placement = pitcher.pitch_placement
    @swing = batter.swing?(placement)
    @contact = contact_check
    @fair_or_foul = fair_foul_check
    @hit_or_fielded = hit_checker
    @fielder_position = hit_to?
    @out_or_error = fielding_checker
    @hit_type = extra_bases_checker
    keep_stats
  end

  def keep_stats
    #get strike zone to binary
    strike_zone = if placement == :strike then true else false end

    #find fielder
    if fielder_position
      fielder = fielding_team.positions[fielder_position.to_i]
    end

    #condense contact result to one value that I care about
    contact_result = nil
    if hit_type
      contact_result = hit_type
    elsif out_or_error
      contact_result = out_or_error
    elsif hit_or_fielded
      contact_result = hit_or_fielded
    elsif fair_or_foul
      contact_result = fair_or_foul
    end

    StatKeeper.create(game_id: game.id, inning_number: inning_number,
      pitcher_id: pitcher.id, batter_id: batter.id, fielder_id: fielder.id,
      batting_team_id: batter.team, fielding_team_id: fielding_team,
      strike_zone: strike_zone, swing: swing, contact: contact,
      contact_result: contact_result)
  end

  def contact_check
    if swing
      ct_check = batter.contact?(placement, pitcher.throwing_accuracy)
    else ct_check = nil
    end
    ct_check
  end

  def fair_foul_check
    if contact
      ff_check = batter.fair_ball?(pitcher.throwing_velocity)
    else ff_check = nil
    end
    ff_check
  end

  def hit_checker
    if fair_or_foul == :fair
      hit = batter.hit?
    else hit = nil
    end
    hit
  end

  def fielding_checker
    fielding_result = nil
    if hit_or_fielded == :fielded
      fielder = fielding_team.positions[fielder_position]
      if fielder.field_ball
        fielding_result = :out
      else
        if fielder_position >=7
          fielding_result = :two_base_error
        else fielding_result = :one_base_error
        end
      end
    end
    fielding_result
  end

  def hit_to?

    ###########################
    #   Pos     Stat  Real% My%
    ###########################
    # 0 Pitcher 250   4%    3%
    # 1 Catcher 1439  25%   17%
    # 2 First   1314  23%   19%
    # 3 Second  688   12%   15%
    # 4 Third   465   8%    10%
    # 5 Short   608   11%   17%
    # 6 Left    280   5%    4%
    # 7 Center  412   7%    9%
    # 8 Right   280   5%    6%
    # # Total   5736  100%  100%
    ###########################

    roll = rand(100)
    fielder_number = case roll
    when 97..100
    0
    when 80...97
    1
    when 61...80
    2
    when 46...61
    3
    when 36...46
    4
    when 19...36
    5
    when 15...19
    6
    when 6...15
    7
    when 0...6
    8
    else "hit_to? error"
    end
    fielder_number
  end


  def extra_bases_checker
    if hit_or_fielded == :hit
      bases_do = batter.extra_bases?
    elsif hit_or_fielded == :fielded
      if out_or_error == :two_base_error
        bases_do = :double
      elsif out_or_error == :one_base_error
        bases_do = :single
      end
    else
      bases_do = nil
    end
    bases_do
  end

end

