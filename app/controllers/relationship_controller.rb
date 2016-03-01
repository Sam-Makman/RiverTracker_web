class RelationshipController < ApplicationController
  def create
    if !exists?(params[:format])
      current_user.active_relationships.create(favorited_id:params[:format])
      redirect_to root_path
    else
      redirect_to rivers_path
    end
  end

  def destroy
  end

  private
  def exists?(id)
    Relationship.exists?(favoriter_id: current_user.id, favorited_id:id)
  end
end
