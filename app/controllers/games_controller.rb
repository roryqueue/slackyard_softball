class GamesController < ApplicationController

  def index
    @games = Game.order("created_at DESC")
  end

  def show
    @game = Game.find(params[:id])
    @runs = @game.score_keepers.order("created_at DESC")
    @home_pitcher = @game.home_team_lineup.pitcher
    @away_pitcher = @game.away_team_lineup.pitcher
  end

end
