class MatchesController < ApplicationController
  def index
    @matches = Match.all
    render :index
  end

  def create
    @match = Match.create(
      bracket_id: params["bracket_id"],
      pick_team_id: params["pick_team_id"],
      game_id: params["game_id"],
    )
    render :show
  end

  def show
    @match = Match.find_by(id: params[:id])
    render :show
  end

  def update
    @match = Match.find_by(id: params[:id])
    @match.update(
      game_id: params[:game_id] || @match.game_id,
      pick_team_id: params[:pick_team_id] || @match.pick_team_id,
      winner_team_id: params[:winner_team_id] || @match.winner_team_id,
    )
    #happy path
    if @match.valid?
      render :show
      #sad path
    else
      render json: { errors: @match.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @match = Match.find_by(id: params[:id])
    @match.destroy
    render json: { message: "match has been deleted 😈" }
  end
end
