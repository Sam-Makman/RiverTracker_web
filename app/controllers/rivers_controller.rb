class RiversController < ApplicationController
  before_action :admin, only: [:destroy, :edit]
  before_action :logged_in_user


  def index
    if !params[:commit].nil?
      @rivers = search_params
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
  def search_params
    if params[:name].length > 0
      search_by(:name, params[:name])
    elsif params[:section].length > 0
      search_by(:section, params[:section])
    elsif params[:difficulty].length > 0
      search_by(:difficulty, params[:difficulty])
    elsif params[:state].length > 0
      search_by(:state, params[:state])
    end
  end

  private
  def river_params
    params.require(:river).permit(:name, :section, :difficulty, :usgs_id, :details, :state, :put_in, :take_out)
  end

  private
  def search_by_name(name)
    River.where("name LIKE (?)","%#{name}%")
  end

  private
  def search_by_section(section)
    River.where("section LIKE (?)","%#{section}%")
  end

  private
  def search_by_difficulty(difficulty)
    River.where("difficulty LIKE (?)","%#{difficulty}%")
  end

  private
  def search_by_state(state)
    River.where("state LIKE (?)","%#{state}%")
  end

  private
  def search_by(field = :name, term)
    if field == :name
      search_by_name term
    elsif field == :section
      search_by_section term
    elsif field == :difficulty
      search_by_difficulty term
    elsif field == :state
      search_by_state term
    end
  end


end
