class RelationshipController < ApplicationController
  def create
    if !exists?(params[:format])
      current_user.active_relationships.create(favorited_id:params[:format])
      flash[:success] ="Favorite added"
      redirect_to root_path
    else
      flash[:error] = "You have already favorited this river"
      redirect_to rivers_path
    end
  end

  def destroy
    if exists?(params[:format])
      current_user.active_relationships.find_by(favorited_id: params[:format]).destroy
      flash[:success]  = "Favorite deleted"
      redirect_to root_path
    else
      flash[:error] = "Could not delete favorite"
      redirect_to root_path
    end
  end

  private
  def exists?(id)
    Relationship.exists?(favoriter_id: current_user.id, favorited_id:id)
  end
end
