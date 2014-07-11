class PlayersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @players = Player.where(team_id: params(:team_id))
  end

  def show
    @player = Player.find(params[:id])
  end
end
