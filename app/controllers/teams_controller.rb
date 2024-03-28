class TeamsController < ApplicationController
  def index
    @teams = Team.all
    render :index
  end

  def create
    @team = Team.create(
      name: params["name"],
      seed: params["seed"],
      region: params["region"],
      superseed: params["superseed"],
      char6: params["char6"],
    )
    render :show
  end

  def show
    @team = Team.find_by(id: params[:id])
    render :show
  end

  def update
    @team = Team.find_by(id: params[:id])
    @team.update(
      name: params[:name] || @team.name,
      seed: params[:seed] || @team.seed,
      region: params[:region] || @team.region,
      superseed: params[:superseed] || @team.superseed,
      char6: params[:char6] || @team.char6,
    )
    #happy path
    if @team.valid?
      render :show
      #sad path
    else
      render json: { errors: @team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @team = Team.find_by(id: params[:id])
    @team.destroy
    render json: { message: "team has been deleted 😈" }
  end
end
