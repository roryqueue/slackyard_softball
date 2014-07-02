require_relative 'half_inning'
require 'pry'


class Inning
  attr_reader :home_team, :away_team, :number, :home_score, :away_score

  def initialize(home_team, away_team, number)
    @home_team = home_team
    @away_team = away_team
    @number = number
    @home_score = 0
    @away_score = 0
    play
  end

  def play
    away_bats = HalfInning.new(home_team, away_team)
    @away_score = away_bats.runs
    home_bats = HalfInning.new(away_team, home_team)
    @home_score = home_bats.runs
    puts number
  end

end
