class StaticPagesController < ApplicationController

  def home
    @user = current_user
    @river = River.new if logged_in?
    @rivers = @user.favorites if logged_in?
  end

  def help
  end

  def about
  end
end
