class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.team = Team.find(params[:team_id])

    if @player.save
      flash[:notice] = "Your player '#{@player.name}' has been created!"
      redirect_to team_path(@player.team)
    else
      flash.now[:notice] = "Your player could not be created!"
      render "players#new"
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :picture,
      :batting_contact, :batting_power, :pitching_craftiness,
      :pitching_accuracy, :fielding, :speed)
  end
end
