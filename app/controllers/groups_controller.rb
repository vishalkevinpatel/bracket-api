class GroupsController < ApplicationController
  def index
    @groups = Group.all
    render :index
  end

  def create
    @group = Group.create(
      name: params["name"],
    )
    render :show
  end

  def show
    @group = Group.find_by(id: params[:id])
    render :show
  end

  def update
    @group = Group.find_by(id: params[:id])
    @group.update(
      name: params[:name] || @group.name,
    )
    #happy path
    if @group.valid?
      render :show
      #sad path
    else
      render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    @group.destroy
    render json: { message: "group has been deleted 😈" }
  end
end
