class GamesController < ApplicationController

  def index
    @games = Game.order("created_at DESC")
  end

  def show
    @game = Game.find(params[:id])
    @runs = @game.score_keeper.order("created_at DESC")
    @home_pitcher = Game.home_team_lineup.pitcher
    @away_pitcher = Game.away_team_lineup.pitcher
  end

end
