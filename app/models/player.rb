class Player < ActiveRecord::Base
  mount_uploader :picture, PlayerPicUploader
  belongs_to :team
  # attr_reader :first_name, :last_name, :batting_contact, :batting_power, :pitching_craftiness, :pitching_accuracy, :fielding, :speed
  #
  # def initialize(first_name, last_name, batting_contact, batting_power,
  #               pitching_craftiness, pitching_accuracy, fielding, speed)
  #   @first_name = first_name
  #   @last_name = last_name
  #   @batting_contact = batting_contact
  #   @batting_power = batting_power
  #   @pitching_craftiness = pitching_craftiness
  #   @pitching_accuracy = pitching_accuracy
  #   @fielding = fielding
  #   @speed = speed
  # end

################# STAT HELPERS #################
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def homeruns
    StatKeeper.where(batter_id: self.id).where(contact_result: 'homerun').count
  end

  def triples
    StatKeeper.where(batter_id: self.id).where(contact_result: 'triple').count
  end

  def doubles
    StatKeeper.where(batter_id: self.id).where(contact_result: 'double').count
  end

  def singles
    StatKeeper.where(batter_id: self.id).where(contact_result: 'single').count
  end

  def rbis
    ScoreKeeper.where(batter_id: self.id).count
  end

  def runs_scored
    ScoreKeeper.where(scorer_id: self.id).count
  end

  def batting_average
    hits = self.homeruns + self.triples + self.doubles + self.singles
    outs = OutKeeper.where(batter_id: self.id).count
    unless outs.nil? || outs == 0
      average = (hits.to_f / (hits.to_f + outs.to_f)).round(3)
    end
    reformatted_average = ('%.3f' % average).sub(/^[0:]*/,"")
  end

  def innings_pitched
    OutKeeper.where(pitcher_id: self.id).count.to_f / 3
  end

  def era
    runs = ScoreKeeper.where(pitcher_id: self.id).count
    unless self.innings_pitched.nil? || self.innings_pitched == 0
      era = ((runs.to_f / innings_pitched) * 9.0).round(2)
      reformatted_era = '%.2f' % era
    end
  end

  def strikeouts_thrown
    OutKeeper.where(pitcher_id: self.id).where(detail: 'strikeout').count
  end

  def wins
    home_games = Game.where(home_team_lineup_id: Lineup.select(:id).where(pitcher_id: self.id))
    home_wins = 0
    home_games.each do |game|
      if game.home_score > game.away_score
        home_wins += 1
      end
    end
    away_games = Game.where(away_team_lineup_id: Lineup.select(:id).where(pitcher_id: self.id))
    away_wins = 0
    away_games.each do |game|
      if game.away_score > game.home_score
        away_wins += 1
      end
    end
    wins = home_wins + away_wins
  end

  def losses
    home_games = Game.where(home_team_lineup_id: Lineup.select(:id).where(pitcher_id: self.id))
    home_losses = 0
    home_games.each do |game|
      if game.home_score < game.away_score
        home_losses += 1
      end
    end
    away_games = Game.where(away_team_lineup_id: Lineup.select(:id).where(pitcher_id: self.id))
    away_losses = 0
    away_games.each do |game|
      if game.away_score < game.home_score
        away_losses += 1
      end
    end
    losses = home_losses + away_losses
  end

  def err_count
    StatKeeper.where(fielder_id: self.id).where(contact_result: ['one_base_error', 'two_base_error']).count
  end

  def field_percentage
    if StatKeeper.where(fielder_id: self.id).count > 0
      field_perc = ( 1 - (self.err_count.to_f) / StatKeeper.where(fielder_id: self.id).count.to_f).round(3)
    reformatted_field_perc = '%.3f' % field_perc
    end
  end

################# PITCHER ######################

  def pitch_placement
    placed = nil
    #MLB pitchers average 62% strikes
    if rand(pitching_accuracy + 50) > pitching_accuracy
      placed = :ball
    else
      placed = :strike
    end
    placed
  end

################# BATTER ######################

  def swing?(placement)
    roll = rand(100)
    if placement == :strike
      #MLB batters swing at 65% of strikes
      if roll > 35
        swing = true
      else
        swing = false
      end
    elsif placement == :ball
      #MLB batters swing at 30% of balls
      if roll > 70
        swing = true
      else
        swing = false
      end
    # else raise "batter_swing error!"
    end
    swing
  end

  def contact?(placement, pitcher_velocity)
    #MLB batters make contact with swung-at strikes 88% of the time
    if placement == :strike
      if rand < log_five((batting_contact + 3 / 20 * (100 - batting_contact)), ((pitcher_velocity) * (19 / 20)))
        contact = true
      else
        contact = false
      end
    elsif placement == :ball
    #MLB batters make contact with strikes 68% of the time
      if rand < log_five((batting_contact + 1 / 20 * (100 - batting_contact)), ((pitcher_velocity) * (19 / 20)))
      contact = true
      else
      contact = false
      end
    # else raise "batter_contact error!"
    end
    contact
  end

  def fair_ball?(pitcher_velocity)
    #batters foul of 40.5% of balls they make contact with (does not count foulouts)
    if rand < log_five((batting_contact + 1 / 10 * (100 - batting_contact)), ((pitcher_velocity) * (19 / 20)))
      ball = :fair
    else
      if rand(10) > 1
        ball = :foul
      else
        ball = :foulout
      end
    end
    ball
  end

  def hit?
    if rand(200 + batting_contact) > batting_contact
      ball = :fielded
    else
      ball = :hit
    end
    ball
  end

  def extra_bases?
    #hits are: 67.6% singles, 19.5% doubles, 1.9% triples, 11.0% homeruns
    roll = rand(175 + batting_power + speed)
    if roll < (batting_power / 2)
      hit = :homerun
    elsif roll < ((batting_power / 2) + (speed / 8))
      hit = :triple
    elsif roll < (batting_power + speed)
      hit = :double
    else hit = :single
    end
    hit
  end

################# FIELDER ######################

  def field_ball
    fielded = nil
    if rand(500) > (400 + fielding)
      fielded = :no
    else fielded = :yes
    end
    fielded
  end

end
