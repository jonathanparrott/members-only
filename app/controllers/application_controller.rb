class ApplicationController < ActionController::Base
  def sign_in(user)
    user.remember
    cookies.permanent.signed[:remember_token] = user.remember_token
    current_user=user
  end

  def sign_out(user)
    @current_user = nil
    cookies[:remember_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(remember_digest: User.digest(cookies[:remember_token]))
  end

  def current_user=(user)
    @currentuser = user
  end

  def signed_in?
    !@current_user.nil?
  end

  def signed_in_user
    unless signed_in?
        flash.now[:danger] = "Not allowed."
        redirect_to signup_path
    end
  end

end
