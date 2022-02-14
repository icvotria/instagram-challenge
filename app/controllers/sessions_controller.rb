class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      flash.now[:success] = "Welcome back, #{@user.username}!!"
      session[:username] = @user.username
      redirect_to posts_path
    else
      p 'login failed'
      flash.now[:alert] = "Something went wrong! Please check your password and email are correct"
      redirect_to login_path
    end
  end

  def destroy
    redirect_to posts_path, notice: "Bye, #{session[:username]}!!"
    session[:username] = nil
  end
end
