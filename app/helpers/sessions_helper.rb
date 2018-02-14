module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #Return to user page if the user is logged
  def block_logged
    if logged_in?
      redirect_to current_user
    end
  end

  #Return to login if user isn't logged
  def block_non_logged
    if !logged_in?
      redirect_to login_path
    end
  end

  def is_admin
    if !current_user.admin?
      redirect_to user_path(current_user)
      flash[:info] = "Voce nao é administrador!"
    end
  end

  def isnt_admin
    if !current_user.admin?
      respond_to do |format|
        format.html { redirect_to current_user, notice: "Ação inválida!" }
      end
    end
  end

  def is_director_or_admin
    if !current_user.director? || !current_user.admin?
      redirect_to user_path(current_user)
      flash[:info] = "Voce nao é um diretor ou administrador!"
    end
  end

end
