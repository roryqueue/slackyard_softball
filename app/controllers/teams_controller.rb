class TeamsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @team = Team.find(params[:id])
  end

  def new
    @league = League.find(params[:league_id])
    @team = Team.new
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

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if owner?
      @team.update(team_params)
      flash[:notice] = "#{@team.name} has been successfully updated!"
      redirect_to league_team_path(@team.league, @team)
    end
  end

  def destroy
    @team = Team.find(params[:id])

    if owner?
      @team.destroy

      flash[:notice] = "#{@team.name} has been permanently shut down."
      redirect_to league_path(@team.league)
    end
  end

  def owner?
    current_user.try(:id) == @team.user_id
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

end
