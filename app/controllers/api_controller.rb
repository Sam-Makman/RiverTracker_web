class ApiController < ApplicationController
  before_action :authenicate, only:[:logout, :favorites]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = Digest::SHA1.hexdigest([Time.now, rand].join)
      token_digest = Digest::SHA1.hexdigest(token)
      user.update(api_token: token_digest)
      render :json =>{
          :token => token
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
    user = User.new(user_params)
    token = Digest::SHA1.hexdigest([Time.now, rand].join)
    token_digest = Digest::SHA1.hexdigest(token)
    user.update(api_token: token_digest)
    render :json =>{
        :token => token
    }
  end

  def rivers
    river_list = River.all
    render json: river_list
  end

  def river
    river = River.find(params[:id])
    render json: river
  end

  def favorites
    user = User.find_by(api_token: Digest::SHA1.hexdigest(params[:token]))
    rivers = user.favorites
    render json: rivers

  end

  private
  def authenicate
    user = User.find_by(api_token: Digest::SHA1.hexdigest(params[:token]))
    if !user
      render :json =>{
          :error => "Failed to Authenicate"
      }
      redirect_to logout
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmaiton)
  end

  def search(params)
    River.where("name LIKE (?)","%#{params[:name]}%")
        .where("section LIKE (?)","%#{params[:section]}%")
        .where("difficulty LIKE (?)","%#{params[:difficulty]}%")
        .where("state LIKE (?)","%#{params[:state]}%")
        .where(approved: true)
  end
end
