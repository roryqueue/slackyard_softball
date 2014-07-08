class GamesController < ApplicationController

  def index
    @games = Game.order("created_at DESC")
  end

  def show
    @game = Game.find(params[:id])
  end

end
