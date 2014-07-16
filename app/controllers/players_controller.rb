class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user if current_user
    @team.league = League.find(params[:league_id])

    if @team.save
      flash[:notice] = "Your team '#{@team.name}' has been created!"
      redirect_to team_path(@team)
    else
      flash.now[:notice] = "Your team could not be created!"
      render "teams#new"
    end
  end
end
