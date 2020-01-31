class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
      if @user && @user.authenticate(params[:password])
        sign_in(@user)
        @current_user = @user
      else
        flash.now[:danger] = 'Invalid Login'
        render 'new'
      end
  end

  def delete
    sign_out if signed_in?
  end

end