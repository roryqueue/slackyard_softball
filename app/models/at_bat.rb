
require_relative 'player'
require_relative 'maths'

class AtBat
  attr_reader :pitcher, :batter, :fielding_team
  attr_accessor :count, :result

  def initialize(fielding_team, batter)
    @batter = batter
    @fielding_team = fielding_team
    @pitcher = fielding_team.pitcher
    @count = Count.new
    play
  end

  def play
    pitch = Pitch.new(fielding_team, batter)
    update_count(pitch)
    until result_test(pitch) != nil
    pitch = Pitch.new(fielding_team, batter)
    update_count(pitch)
    puts "#{count.pitches} pitches, #{count.balls} balls, #{count.strikes} strikes"
    end
  end

  def update_count(pitch)
    count.pitches += 1
    if pitch.swing == false
      if pitch.placement == :strike
        count.strikes += 1
      elsif pitch.placement == :ball
        count.balls += 1
      end
    elsif pitch.swing
      if pitch.contact == false
        count.strikes +=1
      elsif pitch.contact && pitch.fair_or_foul == :foul && count.strikes < 2
        count.strikes += 1
      end
    end
  end

  def strikeout?
    count.strikes >= 3
  end

  def walk?
    count.balls >= 4
  end

  def result_test(pitch)
    result = nil
    if pitch.fair_foul_check == :foulout || strikeout?
      result = :out
    elsif pitch.hit_or_fielded == :hit
      result = pitch.hit_type
    elsif walk?
      result = :walk
    elsif pitch.out_or_error
      result = pitch.out_or_error
    end
    @result = result
    result
  end

end
