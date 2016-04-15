class ApiController < ApplicationController
  before_action :authenicate, only:[:logout, :favorites, :favorite]
  skip_before_action :verify_authenticity_token , if :json_request?
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = Digest::SHA1.hexdigest([Time.now, rand].join)
      token_digest = Digest::SHA1.hexdigest(token)
      user.update(api_token: token_digest)
      render :json =>{
          :token => token
      }
    else
      render :json =>{
          :error => "failed to login"
      }
    end

  end

  def logout
    user = User.find_by(api_token: Digest::SHA1.hexdigest(params[:token]))
    if user
      user.update(api_token: '')
    end

  end

  def signup
    @user = User.new(user_params)
    if @user
    token = Digest::SHA1.hexdigest([Time.now, rand].join)
    token_digest = Digest::SHA1.hexdigest(token)
    @user.update(api_token: token_digest)
    render :json =>{
        :token => token
    }
    else
      render json: {error: "failed to create user"}
    end
  end

  def rivers
    @rivers = search params
    if @rivers.nil?
      @rivers = []
    end
    render 'rivers/index.json.jbuilder'
  end

  def river
    @river = River.find(params[:id])
    @alerts = Alert.where(river_id: @river.id )
    render 'rivers/show.json.jbuilder'
  end

  def alert
    @river = River.find(params[:id])
    @alerts = Alert.where(river_id: @river.id )
    render json: @alerts
  end

  def favorites
    user = User.find_by(api_token: Digest::SHA1.hexdigest(params[:token]))
    @rivers = user.favorites
    render 'rivers/index.json.jbuilder'
  end

  def favorite
      @user = User.find_by(api_token: Digest::SHA1.hexdigest(params[:token]))
      if !@user.nil?
        @user.active_relationships.create(favorited_id: params[:id])

      end
      render json:{
          code: 201,
          message: "Operation sucessful"
      }
  end


  private
  def authenicate
    user = User.find_by(api_token: Digest::SHA1.hexdigest(params[:token]))
    if !user
      render :json =>{
          :error => 401,
          :message => "User is Unauthorized"
      }
    end

  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmaiton)
  end

  def search(params)
    if params[:difficulty] == '' || params[:difficulty].nil?
      River.where("lower(name) LIKE (?)","%#{downcase_or_nil(params[:name]) || '' }%")
          .where("lower(section) LIKE (?)","%#{downcase_or_nil(params[:section]) || '' }%")
          .where("lower(state) LIKE (?)","%#{downcase_or_nil(params[:state]) || '' }%")
          .where(approved: true)
          .order('state asc')
    else
      River.where("lower(name) LIKE (?)","%#{downcase_or_nil(params[:name]) || '' }%")
          .where("lower(section) LIKE (?)","%#{downcase_or_nil(params[:section]) || '' }%")
          .where(difficulty: params[:difficulty] || '')
          .where("lower(state) LIKE (?)","%#{downcase_or_nil(params[:state]) || '' }%")
          .where(approved: true)
          .order('state asc')
    end

  end

  def downcase_or_nil param
    if !param.nil?
      param.downcase
    end
  end

    def json_request
      request.format.json?
    end
  end
end
