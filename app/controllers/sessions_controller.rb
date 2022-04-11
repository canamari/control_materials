class SessionsController < ApplicationController
  def new
    @user = User.find_by(user_name: params[:user_name])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to materials_path
    else
      message = "login errado"
      redirect_to login_path, notice: message
    end
  end
end
