class Api::SessionsController < ApplicationController
  def create
    debugger
    @user = User.find_by_credentials(user_params[:username], user_params[:password])

    if @user && @user.is_password?( user_params[:password])
      login(@user)
      render 'api/users/show'
    else
      render json: ["invalid credentials"], status: 422
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token
      session[:session_token] = nil
      render {}
    else
      render json: {status: 404}
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
