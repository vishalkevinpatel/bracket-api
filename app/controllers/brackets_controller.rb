class BracketsController < ApplicationController
  def index
    @brackets = Bracket.all
    render :index
  end

  def create
    @bracket = Bracket.create(
      user_id: "1",
      name: params["name"],
    )
    render :show
  end

  def show
    @bracket = Bracket.find_by(id: params[:id])
    render :show
  end

  def update
    @bracket = Bracket.find_by(id: params[:id])
    @bracket.update(
      total_points: params[:total_points] || @bracket.total_points,
      round1: params[:round1] || @bracket.round1,
      round2: params[:round2] || @bracket.round2,
      round3: params[:round3] || @bracket.round3,
      round4: params[:round4] || @bracket.round4,
      round5: params[:round5] || @bracket.round5,
      round6: params[:round6] || @bracket.round6,
      round0: params[:round0] || @bracket.round0,
    )
    #happy path
    if @bracket.valid?
      render :show
      #sad path
    else
      render json: { errors: @bracket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @bracket = Bracket.find_by(id: params[:id])
    if @bracket.user_id == current_user.id
      @bracket.update(
        user_id: 1,
      )
      render json: { message: "Bracket has been deleted 😈" }
    else
      render json: { message: "you cannont delete this bracket" }
    end
  end
end
