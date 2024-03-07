class GamesController < ApplicationController
  def index
    @games = Game.all
    render :index
  end

  def create
    @game = Game.create(
      home_team_id: params["home_team_id"],
      away_team_id: params["away_team_id"],
      winner_team_id: params["winner_team_id"],
      round: params["round"],
    )
    render :show
  end

  def show
    @game = Game.find_by(id: params[:id])
    render :show
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(
      home_team_id: params[:home_team_id] || @game.home_team_id,
      away_team_id: params[:away_team_id] || @game.away_team_id,
      winner_team_id: params[:winner_team_id] || @game.winner_team_id,
      round: params[:round] || @game.round,
    )
    #happy path
    if @game.valid?
      render :show
      #sad path
    else
      render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    @game.destroy
    render json: { message: "game has been deleted 😈" }
  end
end
