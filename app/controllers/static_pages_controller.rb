class StaticPagesController < ApplicationController

  def home
    @user = current_user
    if logged_in?
      @river = River.new
      @rivers = @user.favorites
      @rivers = [] if @rivers.nil?
    end
  end

  def help
  end

  def about
  end
end
