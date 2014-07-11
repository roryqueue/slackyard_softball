class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @teams = Team.where(league_id: params(:league_id))
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user if current_user
    @team.league_id = params[:league_id]

    if @team.save
      flash[:notice] = "Your team '#{team.name}' has been created!"
      redirect_to teams_path
    else
      flash.now[:notice] = 'Your team could not be created!'
      render :new
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
      redirect_to team_path(@team)
    end
  end

  def destroy
    @team = Team.find(params[:id])

    if owner?
      @team.destroy

      flash[:notice] = "#{@team.name} has been permanently shut down."
      redirect_to teams_path
    end
  end

  def owner?
    current_user == @team.user
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

end
