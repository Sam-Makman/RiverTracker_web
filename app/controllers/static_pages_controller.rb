class StaticPagesController < ApplicationController

  def home
    @user = current_user
    if logged_in?
      @river = River.new
      @rivers = search params
      if  @user.nil? || @user.favorites.nil?
        @rivers = []
      else
        @rivers = @user.favorites
      end

    end
  end

  def help
  end

  def about
  end

  def search(params)
    River.where("name LIKE (?)","%#{params[:name]}%")
        .where("section LIKE (?)","%#{params[:section]}%")
        .where("difficulty LIKE (?)","%#{params[:difficulty]}%")
        .where("state LIKE (?)","%#{params[:state]}%")
        .where(approved: true)
  end
end
