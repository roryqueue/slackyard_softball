class LineupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = Team.find(params[:team_id])
    @lineup = Lineup.new
  end

  def create
    @lineup = Lineup.new(lineup_params)
    @lineup.user = current_user if current_user
    @lineup.team = Team.find(params[:team_id])
    if owner?
      if @lineup.save
        flash[:notice] = "Your lineup '#{@lineup.nickname}' has been created!"
        redirect_to lineup_path(@lineup)
      else
        flash.now[:notice] = "Your lineup could not be created!"
        render "lineups#new"
      end
    end
  end

  def edit
    @lineup = Lineup.find(params[:id])
  end

  def update
    @lineup = Lineup.find(params[:id])

    if owner?
      @lineup.update(lineup_params)
      flash[:notice] = "#{@lineup.nickname} has been successfully updated!"
      redirect_to team_lineup_path(@lineup.team, @lineup)
    end
  end

  def destroy
    @lineup = Lineup.find(params[:id])

    if owner?
      @lineup.destroy

      flash[:notice] = "#{@lineup.nickname} has been deleted."
      redirect_to team_path(@lineup.team)
    end
  end

  def owner?
    current_user.try(:id) == @lineup.team.user_id
  end

  private

  def lineup_params
    params.require(:lineup).permit(:pitcher_id, :catcher_id, :first_baseman_id, :second_baseman_id, :third_baseman_id,
      :shortstop_id, :left_fielder_id, :center_fielder_id, :right_fielder_id, :first_up_id, :second_up_id, :third_up_id,
      :fourth_up_id, :fifth_up_id, :sixth_up_id, :seventh_up_id, :eighth_up_id, :ninth_up_id, :nickname)
  end

end

