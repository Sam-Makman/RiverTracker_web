class RiversController < ApplicationController
  before_action :admin, only: [:destroy, :edit]
  before_action :logged_in_user


  def index
    if !params[:commit].nil?
      @rivers = River.where('name LIKE ?', params[:q]).all
      if @rivers.nil?
        @rivers = []
      end
    else
      @rivers = River.all
    end
  end

  def show
    @river = River.find(params[:id])
  end

  def create
    @river = River.new(river_params)
    if @river.valid? && @river.save
      redirect_to root_path
    else
      @rivers = River.all
      @user = current_user
      render 'static_pages/home'
    end
  end

  def destroy
    river = River.find(params[:id])
    river.destroy
    respond_to do |format|
      format.html { redirect_to rivers_url, notice: 'River was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  private
  def logged_in_user

  end



  private
  def river_params
    params.require(:river).permit(:name, :section, :difficulty, :usgs_id, :details, :state, :put_in, :take_out)
  end

end
