class GroupBracketsController < ApplicationController
  def index
    @group_brackets = GroupBracket.all
    render :index
  end

  def create
    @group_bracket = GroupBracket.create(
      group_id: params["group_id"],
      bracket_id: params["bracket_id"],
    )
    render :show
  end

  def show
    @group_bracket = GroupBracket.find_by(id: params[:id])
    render :show
  end

  def update
    @group_bracket = GroupBracket.find_by(id: params[:id])
    @group_bracket.update(
      group_id: params[:group_id] || @group_bracket.group_id,
      bracket_id: params[:bracket_id] || @group_bracket.bracket_id,
    )
    #happy path
    if @group_bracket.valid?
      render :show
      #sad path
    else
      render json: { errors: @group_bracket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @group_bracket = GroupBracket.find_by(id: params[:id])
    @group_bracket.destroy
    render json: { message: "group_bracket has been deleted 😈" }
  end
end
