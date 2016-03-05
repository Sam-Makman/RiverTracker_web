class StaticPagesController < ApplicationController

  def home
    @user = current_user
    if logged_in?
      @river = River.new
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
end
