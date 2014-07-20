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
    if owner?
      if @player.save
        flash[:notice] = "Your player '#{@player.name}' has been created!"
        redirect_to team_path(@player.team)
      else
        flash.now[:notice] = "Your player could not be created!"
        render "players#new"
      end
    end
  end

  def destroy
    @player = Player.find(params[:id])

    if owner?
      @player.destroy

      flash[:notice] = "#{@player.name} has been kicked off the team!"
      redirect_to team_path(params[:team_id])
    end
  end

  def owner?
    current_user.try(:id) == @player.team.user_id
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :picture,
      :batting_contact, :batting_power, :pitching_craftiness,
      :pitching_accuracy, :fielding, :speed)
  end
end
