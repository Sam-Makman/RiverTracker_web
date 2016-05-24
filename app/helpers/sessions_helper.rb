module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end



# Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Remembers a user in a persistent session.
  def remember(user)
    if user.remember
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    else
      token = User.new_token
      user[:remember_digest] = User.digest(token)
      user.save
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = token
    end

  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

# Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end


  def admin?
    if logged_in?
      user = current_user.role.eql?("Admin")
    else
      false
    end

def advertiser?
  if logged_in?
    user = current_user.role.eql?("Advertiser")
  else
    false
  end

    def role
      return current_user.role
    end

  end

  def admin
    redirect_to root_path unless admin?
  end

end
