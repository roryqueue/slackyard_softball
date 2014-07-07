class LeaguesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @leagues = League.order("updated_at DESC")
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.commissioner_id = current_user.id if current_user

    if @beard.save
      flash[:notice] = "Your league '#{league.name}' has been created! Make changes to is on the League Commissioner page."
      redirect_to leagues_path
    else
      flash.now[:notice] = 'Your league could not be created!'
      render :new
    end
  end

  def destroy
    @league = League.find(params[:id])

    if current_user == @league.commissioner
      @league.destroy
      redirect_to leagues_path
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :commissioner_id)
  end

end
