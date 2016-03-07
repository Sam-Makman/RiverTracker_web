class RiversController < ApplicationController
  before_action :admin, only: [:destroy, :edit, :pending, :approve]
  before_action :logged_in_user, only: [:create, :destroy, :edit]


  def index
    if !params[:commit].nil?
      @rivers = search params
      if @rivers.nil?
        @rivers = []
      end
    else
      @rivers = River.where(approved: true)
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
    @river = River.find(params[:id])
  end

  def update
    respond_to do |format|
      @river = River.find(params[:id])
      if @river.update(river_params)
        format.html { redirect_to @river, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @river }
      else
        format.html { render :edit }
        format.json { render json: @river.errors, status: :unprocessable_entity }
      end
    end
  end


  def pending
    get_pending
  end

  def approve
    @river = River.find(params[:format])
    if !@river.nil?
      @river[:approved] = true
      @river.save if @river.valid?
    end
    redirect_to pending_path
  end

  private

  def search(params)
    River.where("name LIKE (?)","%#{params[:name]}%")
        .where("section LIKE (?)","%#{params[:section]}%")
        .where("difficulty LIKE (?)","%#{params[:difficulty]}%")
        .where("state LIKE (?)","%#{params[:state]}%")
        .where(approved: true)
  end

  def get_pending
    @rivers = River.where(approved: false)
    @rivers = [] if @rivers.nil?
  end

  def river_params
    params.require(:river).permit(:name, :section,
                                  :difficulty, :usgs_id, :details, :state,
                                  :put_in, :take_out, :approved, :picture)
  end



end
